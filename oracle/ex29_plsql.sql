/*

ex29_plsql.sql

ANSI-SQL
- 비 절차성 언어(명령어간의 순서가 없다. 흐름이 없다.) -> 제어 흐름이 없다. 문장 단위의 독립적인 언어

PL/SQL
- Procedural Language Extensions to SQL
- 절차성 언어
- 흐름과 제어를 추가
- ANSI-SQL 모두 지원

PL/SQL = ANSI-SQL + 확장(제어구조)


프로시저, Procedure
- 메소드, 함수, 서브루틴 등..
- 순서가 있는 코드의 집합

1. 익명 프로시저
    - 1회용
    - 오라클에 저장 X

2. 실명 프로시저
    - 반복용
    - 저장 프로시저
    - DB Object



PL/SQL 프로시저 블럭 구조(골격)

1. 4개의 키워드로 구성
    - declare
    - begin
    - exception
    - end

2. declare
    - 선언부
    - 프로시저에 사용할 변수, 객체 등을 선언하는 영역
    - 생략 가능

3. begin
    - 실행부(구현부)
    - begin ~ end : 블럭 역할
    - 프로시저 구현 코드를 작성하는 영역(메소드의 body 역할)
    - 생략 불가능
    - 업무 관련 코드 작성 : ANSI-SQL + 연산, 제어 추가(PL/SQL 구문)
    - try절 역할

4. exception
    - 예외 처리부
    - catch절 역할
    - 예외 처리 코드를 작성하는 영역
    - 생략 가능

5. end
    - 실행부(구현부)
    - 생략 불가능



PL/SQL

1. 자료형
    - ANSI-SQL과 동일(확장)

2. 변수 선언하기
    - 변수명 자료형 [not null] [default 값];
    - name varchar2(100) not null
    - ANSI-SQL에서 테이블의 컬럼을 선언하는 방식과 유사
    - 변수는 주로 질의의 결과(***)나 인자값을 저장하는 용도로 사용
    
3. 대입 연산자
    - 컬럼명 = 값 //ANSI. update
    - 변수명 := 값 //PL/SQL


dbms_output.put_line
- 기본적으로 꺼진 상태

set serveroutput on;
set serveroutput off;
    
*/

declare
    num number; --숫자형
    name varchar2(30); -- 문자형
    today date; --날짜형
begin
    
    num := 10;
    dbms_output.put_line(num); --syso
    
    name := '홍길동';
    dbms_output.put_line(name);
    
    today := '2021-05-26'; --리터럴 -> 암시적 형변환
    dbms_output.put_line(today);
    
    today := to_date('2021-05-26', 'yyyy-mm-dd'); --FM
    dbms_output.put_line(today);
    
    today := sysdate;
    dbms_output.put_line(today);
    
end;




declare
    num1 number;
    num2 number default 200;
    num3 number not null := 300;
    num4 number not null default 400;
begin

    dbms_output.put_line('num1: ' || num1); --null 출력 
    dbms_output.put_line('num2: ' || num2); --default 출력
    dbms_output.put_line('num3: ' || num3); --값 출력
    dbms_output.put_line('num4: ' || num4); --default 출력

end;


/*

질의의 결과? (select)
- 여태까지(ANSI-SQL만 사용) -> select 결과 -> 1차 소비(눈) + 폐기
- 지금부터 -> select 결과 -> 변수 저장 -> 1,2,3차 소비...

1. 1행 1열
    - 단일값
    - 1:1
    - 컬럼 1개 -> 변수 1개에 저장

2. 1행 N열
    - 복합값
    - N:N
    - 컬럼 N개 -> 변수 N개에 저장

3. N행 1열
    - 다중값 -> 커서 사용
    
4. N행 N열
    - 다중+복합값 -> 커서 사용


select into절
    - select의 결과 값을 변수에 저장하는 구문

*/

select buseo from tblInsa where name = '홍길동';


declare
    vbuseo varchar2(15); --부서를 저장할 변수
begin

    -- PLS-00428: an INTO clause is expected in this SELECT statement
    -- PL/SQL 블럭내부에서는 select의 결과를 반드시 변수에 저장해야 한다.
    -- 만약 변수에 저장하지 않는 일반 ANSI-SQL의 select문을 그냥 사용하면 에러가 발생한다.
    
    -- select into 사용
    -- select 컬럼 into 변수
    -- ANSI-SQL의 결과를 PL/SQL로 옮겨담는 작업 중 하나(****)
    select buseo into vbuseo from tblInsa where name = '홍길동';
    
    dbms_output.put_line('결과: ' || vbuseo); --PL/SQL 변수
    
    -- ANSI-SQL 식별자 PLS-00201: identifier 'BUSEO' must be declared
    -- PL/SQL 블럭내부에서는 ANSI-SQL의 식별자(테이블명, 컬럼명 등)를 직접 사용할 수 없다.
    dbms_output.put_line('결과: ' || buseo); 

end;









declare
    vname varchar2(15);
    vbuseo varchar2(15);
begin
    
    vname := '이순신';
    
    -- 기존의 ANSI-SQL을 구성하면서 PL/SQL 값을 상수로 사용할 수 있다.
    select buseo into vbuseo from tblInsa where name = vname;
    
    dbms_output.put_line(vbuseo);
    
end;




declare
    vcount number;
begin
    
    select count(*) into vcount from tblInsa where buseo = '총무부';
    dbms_output.put_line('총무부 직원수: ' || vcount || '명');
    
end;



-- select into
-- 1. 컬럼의 갯수 = 변수의 갯수
-- 2. 자료형 일치
-- 3. 순서 일치

declare
    vname varchar2(15);
    vbuseo varchar2(15);
    vjikwi varchar2(15);
    vbasicpay number;
begin

    select name, buseo, jikwi, basicpay into vname, vbuseo, vjikwi, vbasicpay from tblInsa 
        where name = '홍길동';
    
    dbms_output.put_line(vbuseo);
    dbms_output.put_line(vjikwi);
    dbms_output.put_line(vbasicpay);

end;




-- 프로시저 생성 + ANSI-SQL(select) + 결과(PL/SQL 변수에 저장)

set serveroutput on;

declare
    vname varchar2(15);
begin
    
    select name into vname from tblInsa
        where basicpay = (select max(basicpay) from tblInsa);
    
    dbms_output.put_line(vname);
    
end;




declare
    vname varchar2(15);
    vbasicpay number;
begin
    
    select name, basicpay into vname, vbasicpay from tblInsa
        where basicpay = (select max(basicpay) from tblInsa);
    
    dbms_output.put_line(vname);
    dbms_output.put_line(vbasicpay);
    
end;



create table tblTemp
as
select name, buseo, jikwi, city from tblInsa where city = '서울';

select * from tblTemp;


-- tblInsa -> 연봉 1위(select) -> tblTemp 추가(insert)
declare
    vname varchar2(15);
    vbuseo varchar2(15);
    vjikwi varchar2(15);
    vcity varchar2(15);
begin
    
    --1.
    select name, buseo, jikwi, city into vname, vbuseo, vjikwi, vcity from tblInsa
        where basicpay = (select max(basicpay) from tblInsa);
    
    --2.
    insert into tblTemp (name, buseo, jikwi, city) values (vname, vbuseo, vjikwi, vcity);
    
    
end;


select * from tblTemp;



-- tblInsa. 연봉 꼴지 -> 같은 부서 직원을 tblTemp 삭제
declare
    vbuseo varchar2(15);
begin

    --1.
    select buseo into vbuseo from tblInsa
        where basicpay = (select min(basicpay) from tblInsa);
        
    --2.
    delete from tblTemp where buseo = vbuseo;

end;



/*

참조 자료형
- 테이블로부터 직접 자료형을 알아내는 방법
- 생산성 + 유지보수성

1. %type
    - 사용하는 테이블의 특정 컬럼 자료형을 그대로 참조해서 변수에 적용
    a. 자료형
    b. 길이
    c. not null

*/

declare
    vname varchar2(20);
    vssn tblInsa.ssn%type; -- 실제 테이블 컬럼을 참조해서 자료형을 복사해 온다
    vsudang tblInsa.sudang%type;
begin
    select name, ssn, sudang into vname, vssn, vsudang from tblInsa where name = '홍길동';
    dbms_output.put_line(vname);
    dbms_output.put_line(vssn);
    dbms_output.put_line(vsudang);
end;



/*

1. %type
    - 컬럼 참조
    
2. %rowtype
    - 행 참조
    - %type의 집합

*/

declare
    --변수 10개
    vnum tblInsa.num%type;
    vname tblInsa.name%type;
    vssn tblInsa.ssn%type;
    vibsadate tblInsa.ibsadate%type;
    vcity tblInsa.city%type;
    vtel tblInsa.tel%type;
    vbuseo tblInsa.buseo%type;
    vjikwi tblInsa.jikwi%type;
    vbasicpay tblInsa.basicpay%type;
    vsudang tblInsa.sudang%type;
begin
    select * into vnum, vname, vssn, vibsadate, vcity, vtel, vbuseo, vjikwi, vbasicpay, vsudang from tblInsa where name = '홍길동';
    
    dbms_output.put_line(vnum);
    dbms_output.put_line(vname);
    dbms_output.put_line(vtel);
end;



declare
    vrow tblInsa%rowtype; --테이블의 모든 컬럼의 집합 참조, 레코드 참조
begin
    select * into vrow from tblInsa where name = '홍길동';
    
    dbms_output.put_line(vrow.name);
    dbms_output.put_line(vrow.buseo);
    dbms_output.put_line(vrow.city);
    
end;



declare
    vname tblInsa.name%type;
    vgender varchar2(1);
begin
    select substr(ssn, 8, 1) into vgender from tblInsa where name = '이순신';
    
    dbms_output.put_line(vgender);
    
end;




-- 제어문(조건문)

declare
    vnum number := 10; --1. 변수 생성 + 초기화
begin
    
    if vnum > 0 then
        dbms_output.put_line('양수');
    end if;
    
end;







declare
    vnum number := -10;
begin
    
    if vnum > 0 then
        dbms_output.put_line('양수');
    else 
        dbms_output.put_line('양수아님');
    end if;
    
end;





declare
    vnum number := -10;
begin
    
    if vnum > 0 then
        dbms_output.put_line('양수');
    elsif vnum < 0 then -- else if, elsif, elseif 등..
        dbms_output.put_line('양수아님');
    else 
        dbms_output.put_line('영');
    end if;
    
end;














-- 특별 상여금
create table tblBonus (
    seq number primary key,                         --지급내역번호(PK)
    pnum number not null references tblInsa(num),   --직원번호(FK)
    bonus number not null,                          --지급액
    regdate date default sysdate not null           --지급날짜    
);

create sequence seqBonus;

-- 특정 1명 -> 보너스 지급(직위 따라)

declare
    vjikwi tblInsa.jikwi%type;
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
    vbonus number;
begin
    
    -- 1.
    select jikwi, num, basicpay into vjikwi, vnum, vbasicpay from tblInsa where name = '홍길동';
    
    -- 2. 직위 보너스 금액 산정
    if vjikwi in ('부장', '과장') then
        vbonus := vbasicpay * 2;
    elsif vjikwi = '대리' or vjikwi = '사원' then
        vbonus := vbasicpay * 1.5;
    end if;
    
    -- 3. 보너스 지급
    insert into tblBonus (seq, pnum, bonus, regdate) 
        values (seqBonus.nextVal, vnum, vbonus, default);
    
end;

select * from tblInsa;
select * from tblBonus;

select
    i.name as 직원명,
    i.jikwi as 직위,
    i.basicpay as 급여,
    b.bonus as 보너스
from tblInsa i
    inner join tblBonus b
        on i.num = b.pnum;



-- case문
-- ANSI-SQL(case문)과는 다른 구문
-- 1. ANSI-SQL의 case : 표현식 정도 수준만 사용 가능
-- 2. PL/SQL의 case : 문장 단위 실행도 가능

select
    name,
    case
        when substr(ssn, 8, 1) = '1' then '남자'
        when substr(ssn, 8, 1) = '2' then '여자'
    end as gender
from tblInsa;



--tblCountry. continent

declare
    
    vname tblCountry.name%type;
    vcontinent tblCountry.continent%type;
    vresult varchar2(30);
    
begin

    select name, continent into vname, vcontinent from tblCountry where name = '대한민국';
    
    if vcontinent = 'AS' then
        vresult := '아시아';
    elsif vcontinent = 'EU' then
        vresult := '유럽';
    elsif vcontinent = 'AF' then
        vresult := '아프리카';
    else
        vresult := '기타';
    end if;
    
    dbms_output.put_line(vname || '-' || vresult);
    
    
    case vcontinent
        when 'AS' then vresult := '아시아';
        when 'EU' then vresult := '유럽';
        when 'AF' then vresult := '아프리카';
        else vresult := '기타';
    end case;
    
    dbms_output.put_line(vname || '-' || vresult);

end;


/*

반복문

1. loop
- 무한 루프
- 탈출 조건 처리

2. for loop
- 지정 횟수 반복(자바 for문 유사)

3. while loop
- 조건 반복(자바 while문 유사)

*/

set serveroutput on;

begin
    
    loop
        dbms_output.put_line(to_char(sysdate, 'hh24:mi:ss'));
    end loop;
    
end;






declare
    vnum number := 1; --루프 변수 역할
begin

    loop
    
        dbms_output.put_line(vnum);
        vnum := vnum + 1;
        
        -- if + break
        exit when vnum > 10;
    
    end loop;

end;



create table tblLoop (
    seq number primary key,
    data varchar2(30) not null
);

create sequence seqLoop;

-- 더미 데이터 + 10000개 추가
-- data: '데이터1', '데이터2', '데이터3'..

declare
    vnum number := 1;
begin
    loop
    
        insert into tblLoop (seq, data) values (seqLoop.nextVal, '데이터' || vnum);
        vnum := vnum + 1;
        
        exit when vnum > 10000;
        
    end loop;
end;

select * from tblLoop;

delete from tblLoop;


declare
    vname tblInsa.name%type;
    vnum number;
begin
    
    -- tblInsa. 직원번호 1015 ~ 1045. 이름. tblLoop 추가
    vnum := 1015;
    
    loop
    
        -- 1.
        select name into vname from tblInsa where num = vnum;
        
        -- 2.
        insert into tblLoop (seq, data) values (seqLoop.nextVal, vname);
        
        vnum := vnum + 1;
        
        exit when vnum > 1045;        
    
    end loop;
    
end;

select * from tblLoop;












-- for loop
begin
    
    -- i: 루프변수
    -- in: 연결 키워드
    -- 1: 초깃값
    -- 10: 최댓값
    -- ..: 증가
    for i in 1..10 loop
        
        dbms_output.put_line(i);
        
        --PLS-00363: expression 'I' cannot be used as an assignment target
        --i := i + 1;
    
    end loop;
    
    
--    for i in reverse 1..10 loop
--        
--        dbms_output.put_line(i);
--    
--    end loop;

end;



-- 구구단
create table tblGugudan (
    -- ORA-02260: table can have only one primary key
    -- dan number not null primary key,
    -- num number not null primary key,
    
    dan number not null,
    num number not null,
    result number not null,
    
    constraint tblgugudan_dan_num_pk primary key(dan, num) --복합키
);

alter table tblGugudan
    add constraint tblgugudan_dan_num_pk primary key(dan, num);


-- 2단 ~ 9단 : insert x 72번
begin
    
    for vdan in 2..9 loop
        
        for vnum in 1..9 loop
            
            insert into tblGugudan (dan, num, result)
                values (vdan, vnum, vdan * vnum);
        
        end loop;
    
    end loop;
    
end;


select * from tblGugudan;








declare
    vname tblInsa.name%type;
begin
    
    for vnum in 1030..1040 loop
    
        select name into vname from tblInsa where num = vnum;
        
        insert into tblLoop (seq, data) values (seqLoop.nextVal, vname);
    
    end loop;
    
end;

select * from tblLoop;







-- while loop

declare
    vnum number := 1;
begin

    --for 조건 loop
    while vnum <= 10 loop
    
        dbms_output.put_line(vnum);
        vnum := vnum + 1;
        
    end loop;

end;





-- 예외 처리부 

declare
    vnum number;
    vname number;
begin

    dbms_output.put_line('시작');
    
    
    --ORA-06502: PL/SQL: numeric or value error: character to number conversion error
    select name into vname from tblInsa where num = 1001;
    dbms_output.put_line(vname);
    
    
    --vnum := 10;
    vnum := 0;
    
    -- ORA-01476: divisor is equal to zero
    dbms_output.put_line(100 / vnum);
    
    dbms_output.put_line('끝');

exception
    -- catch절. 예외 처리부
    
    when VALUE_ERROR then
        dbms_output.put_line('자료형 불일치');
    
    when zero_divide then
        dbms_output.put_line('0으로 나누려고 함');
    
    when others then -- catch (Exception e) : 모든 종류의 예외 처리
        dbms_output.put_line('예외처리');

end;


/*

1. ERD 완성. 팀작업(같이)
    - 확인 + 완성
    - 논리 + 물리(실제 테이블명, 실제 컬럼명, 자료형, 길이, 제약사항)
    - 산출물: *.exerd

2. DDL 작성. 팀작업(같이)
    - 각종 create 문
    a. create table
    b. 제약 사항(컬럼 수준, 테이블 수준, alter table)
    - 산출물: *.sql

-------------------------------------------------------------- 최소

-------------------------------------------------------------- 오늘 이부분 시작

3. 데이터 생성. 1/N(업무 분담)
    - 분량: 어느 정도 서비가 운영 중인 상태.. 분량
    - 더미 데이터(되도록 정확하게..)
    - 실제 데이터(아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 신중하고 정확하게!!!!!!!!!!)
    a. insert..
    b. update
    c. delete
    - 산출물: *.sql
    
---------------------------------------------------------------- 주말

4. 업무 SQL 작성. 1/N(업무 분담)
    - 요구 분석과 함께 구현


5. 저장 프로시저, 뷰, 트리거, 인덱스 추가 구현. 1/N(업무 분담)
    - 4번이 잘 구현되어 있으면 쉬운 작업들..
    - 4번이 잘 구현되어 있으면 시간 짧은 작업들..


*/

/*

M_003

1. [개설과정조회]
    - 개설과정조회시전체개설과정목록을출력한다.
        - 개설과정고유번호
        - 개설과정명
        - 개설과정기간(시작년월일)
        - 개설과정기간(종료년월일)
        - 강의실번호
        - 개설과목등록여부
        - 교육생등록인원

*/

select...


/*

    1.1 [특정개설과정조회]
  1.1.1 [개설과목정보]
            - 개설과목명
            - 개설과목기간(시작년월일)
            - 개설과목기간(종료년월일)
            - 개설과목교재명
            - 개설과목교사명


*/
select.. where 조건


/*

3. [개설과정수정]
 - 전체개설과정목록을출력한뒤, 특정개설과정을선택하여수정한다.


*/

select..

update..



















