
/*

 2. 테이블 삭제 > 수정된 테이블 생성
    a. 기존 테이블에 데이터 없었을 경우 > 빈테이블
    b. 기존 테이블에 데이터 있었을 경우 >

 테이블 수정하기
 1. 새로운 컬럼 추가하기 : 무난 + 고민(X)
 2. 기존 컬럼 삭제하기 : 무난 + 고민(데이터 삭제, FK)
 3. 기존 컬럼의 정의 수정하기
    - 컬럼명 바꾸기 : 무난 + 고민(기존 데이터X, 기존 쿼리를 변경)
    - 컬럼의 길이 바꾸기 : 무난 + 고민(기존 데이터 길이)
    - 컬럼의 자료형 바꾸기 : 무난 + 고민(기존 데이터)
    - 컬럼의 제약사항 바꾸기 : 무난 + 고민(기존 데이터)
 */

 drop table tblEdit;

create table tblEdit(
    seq number primary key,
    data varchar2(20) not null
);

insert into tblEdit values(1, '마우스');
insert into tblEdit values(2, '키보드');
insert into tblEdit values(3, '모니터');

select * from tblEdit;



select * from tblEdit;

-- 1. 새로운 컬럼 추가 > 가격 컬럼
-- alter table tblEdit add (추가 컬럼 정의);

alter table tblEdit
add (price number(5) null); --null 컬럼 추가

select * from tbledit;

-- table must be empty to add mandatory (NOT NULL) column
alter table tblEdit
add(descrption varchar2(100) not null); -- not null column

drop table tbledit;

alter table tbledit
add(etc varchar2(100) not null);

select * from tbledit;

-- 기존 컬럼 삭제하기
alter table tbledit
drop column etc;

alter table tblEdit
drop column seq;


-- 기존 컬럼의 정의 수정하기
select * from tblEdit;

insert into tblEdit values (4, '올해 새롭게 출시된 초경량 노트북');

-- 3.a 컬럼의 길이 수정하기(확장, 축소)
-- alter table tblEdit modify(컬럼 저의);
alter table tblEdit
modify(data varchar2(100));

insert into tblEdit values (4, '올해 새롭게 출시된 초경량 노트북');

-- cannot decrease column length because some value is too big
alter table tblEdit
modify (data varchar2(20));
desc tblEdit;
select * from tblEdit;

alter table tblEdit
drop column  price;

-- 3.b 컬럼의 자료형 바꾸기
select * from tblEdit;
alter table tblEdit
modify (seq varchar2(100));
-- column to be modified must be empty to change datatype

delete from tbledit;

alter table tblEdit
modify (seq varchar2(100));


-- 3.c 제약 사항 바꾸기
alter table tblEdit
modify (data varchar2(20) null);

-- 3.d 컬럼명 바꾸기
alter table tblEdit
rename column data to name;

select * from tblEdit;
desc tblEdit;

-- 기존 테이블 + 기존 컬럼에 새로운 제약 사항 추가하기
alter table tblEdit
add (color varchar2(100) null);

select * from tblEdit;

alter table tblEdit
add constraint tbledit_color_ck check (color in ('red', 'yellow', 'blue'));

insert into tblEdit values (4, '핸드폰', 'yellow');
insert into tblEdit values (5, '핸드폰', 'black');

create table tblEdit2(
    seq  number,
    data varchar2(30) not null,
    pseq number       not null
);

alter table tblEdit2
add constraint tbledit2_seq_pk primary key(seq);

alter table tblEdit2
add constraint tbledit2_data_ck check(length(data) > =5);

alter table tblEdit2
add constraint tbledit2_pseq_fk foreign key(pseq) references tbledit(seq);

alter table tblEdit2
drop constraint tbledit2_data_ck;

