-- D:\class\server\JSPTest\db.sql

drop table tblAddress;
drop sequence seqAddress;

create table tblAddress (
    seq number primary key,                                 --PK
    name varchar2(30) not null,                             --이름
    age number(2) not null,                                 --나이
    gender char(1) not null check (gender in ('m', 'f')),   --성별
    address varchar2(500) not null                          --주소
);

create sequence seqAddress;

insert into tblAddress (seq, name, age, gender, address) values (seqAddress.nextVal, '홍길동', 20, 'm', '서울시 강남구 역삼동');

update tblAddress set age = age + 1 where name = '아무개';

select * from tblAddress;

commit;


select count(*) from tblAddress;


select name from tblAddress where seq = 51;

delete from tblAddress;
select * from tblAddress;

commit;



-- m1()
create or replace procedure proc_m1
is
begin
    delete from tblAddress;
end;

select * from tblAddress;


-- m2()
create or replace procedure proc_m2(
    pname in varchar2,
    page in number,
    pgender in varchar2,
    paddress in varchar2
)
is
begin
    
    insert into tblAddress (seq, name, age, gender, address) 
        values (seqAddress.nextVal, pname, page, pgender, paddress);
    
end proc_m2;


select * from tblAddress;



-- m3()
create or replace procedure proc_m3(
    pname in varchar2,
    page in number,
    pgender in varchar2,
    paddress in varchar2,
    presult out number
)
is
begin
    
    insert into tblAddress (seq, name, age, gender, address) 
        values (seqAddress.nextVal, pname, page, pgender, paddress);
    
    presult := 1;

exception
    when others then
        presult := 0;

end proc_m3;



-- m4()
create or replace procedure proc_m4(
    pseq in number,
    pname out varchar2,
    page out number,
    pgender out varchar2,
    paddress out varchar2
)
is
begin

    select name, age, gender, address into pname, page, pgender, paddress 
        from tblAddress 
            where seq = pseq;
    
end proc_m4;



select * from tblAddress;





--m5()
create or replace procedure proc_m5(
    pgender in varchar2,
    pcursor out sys_refcursor
)
is
begin

    open pcursor for
        select * from tblAddress where gender = pgender;

end proc_m5;














drop table tblTodo;
drop sequence seqTodo;

create table tblTodo (
	seq number primary key,					--번호(PK)
	todo varchar2(300) not null, 			--할일
	complete char(1) default(0) not null,	--완료유무. 완료(1), 미완료(0)
	regdate date default sysdate not null	--등록시각
);

create sequence seqTodo;

insert into tblTodo (seq, todo, complete, regdate) values (seqTodo.nextVal, ?, ?, ?)

select * from tblTodo;









select * from tblAddress;

delete from tblAddress;

insert into tblAddress (seq, name, age, gender, address) values (seqAddress.nextVal, '홍길동', 20, 'm', '서울시 강남구 역삼동');
insert into tblAddress (seq, name, age, gender, address) values (seqAddress.nextVal, '아무개', 22, 'm', '서울시 강남구 대치동');
insert into tblAddress (seq, name, age, gender, address) values (seqAddress.nextVal, '하하하', 24, 'm', '서울시 강남구 논현동');

commit;





-- 인증 테이블(계정)
drop table tblUser;

create table tblUser (
    id varchar2(30) primary key,                            --아이디(PK)
    pw varchar2(30) not null,                               --암호
    name varchar2(30) not null,                             --이름
    lv number(1) default (1) not null,                      --등급(1,2,3)
    regdate date default sysdate not null                   --가입일
);


insert into tblUser values ('hong', '1111', '홍길동', default, default);
insert into tblUser values ('test', '1111', '테스트', default, default);
insert into tblUser values ('admin', '1111', '관리자', 3, default);

commit;






















