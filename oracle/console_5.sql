select *
from TBLSTUDENT

commit;
select *
from TBLSTUDENT,
     TBLOPENSUBJECT;

update TBLSTUDENT
set retdate = '2021-01-05'
where studentseq in
      (54, 2, 13, 17, 33, 36, 39, 63, 69, 75, 81, 83, 88, 94, 95, 103, 111, 117, 123, 138, 141, 144, 160, 162, 168, 171,
       176, 181, 189, 192)

update TBLSTUDENT
set retdate = '2021-07-08'
where STUDENTSEQ in
      (53, 56, 57, 3, 5, 12, 16, 19, 21, 23, 25, 26, 27, 29, 31, 34, 35, 46, 48, 52, 59, 71, 73, 85, 86, 90, 92, 93, 99,
       101)

update TBLSTUDENT
set retdate = '2020-05-28'
where STUDENTSEQ in
      (1, 4, 6, 8, 10, 11, 14, 18, 20, 28, 30, 32, 38, 43, 45, 47, 49, 51, 58, 60, 61, 64, 65, 66, 67, 68, 72, 78, 80,
       82)


select *
from TBLOPENSUBJECT;



select *
from TBLSTUDENT;

update TBLSTUDENT
set status = '수강중'
where STUDENTSEQ in
      (102, 104, 106, 107, 108, 114, 119, 121, 124, 125, 129, 130, 132, 143, 146, 147, 149, 150, 151, 155, 159, 161,
       164, 169, 175, 177, 180, 183, 188, 190, 191, 194, 196, 198, 200, 203, 209, 218, 220, 223, 225, 226, 229, 230,
       235, 236, 237, 243, 246, 247, 248, 253, 260, 264, 266, 267, 268, 269, 271, 272, 273, 277, 278, 279, 281, 283,
       284, 285, 293, 299)

update TBLSTUDENT
set COMPLETEDATE = null
where STUDENTSEQ in (53, 54, 56, 57);

select *
from tblstudent
where status = '수강중';


-- 수료상태 : 중도탈락 > 미수료 (수강중인 애들로 )
update TBLSTUDENT
set completionStatus = '미수료',
    faildate         = null
where STUDENTSEQ in
      (42, 44, 50, 55, 62, 70, 74, 76, 77, 79, 87, 96, 98, 109, 110, 115, 122, 127, 133, 134, 137, 139, 140, 153, 156,
       157, 165, 166, 170, 172, 174, 178, 179, 182, 186, 187, 197, 199, 201, 202, 205, 208, 212, 216, 217, 221, 227,
       231, 238, 257, 261, 274, 292, 294);
commit;

select *
from TBLSTUDENT;
commit;


select *
from TBLSTUDENT
where STUDENTSEQ in
      (1, 4, 6, 8, 10, 11, 14, 18, 20, 28, 30, 32, 38, 43, 45, 47, 49, 51, 58, 60, 61, 64, 65, 66, 67, 68, 72, 78, 80,
       82);


--2번과정
update TBLSTUDENT
set retdate = '2021-02-08'
where STUDENTSEQ in
      (104, 106, 107, 108, 109, 110, 114, 115, 119, 121, 122, 124, 125, 127, 129, 130, 132, 133, 134, 137, 139, 140,
       143, 146, 147, 149, 150, 151, 153, 155)



commit;

select *
from tblstudent
where STUDENTSEQ in (7,
                     9,
                     22,
                     24,
                     37,
                     40,
                     41);


--3번과정
update TBLSTUDENT
set retdate = '2021-03-29'
where STUDENTSEQ in
      (156, 157, 159, 161, 164, 165, 166, 169, 170, 172, 174, 175, 177, 178, 179, 180, 182, 183, 186, 187, 188, 190,
       191, 194, 195, 196, 197, 198, 199, 200);


-- 4번 과정
update TBLSTUDENT
set retdate = '2021-04-12'
where STUDENTSEQ in
      (201, 202, 203, 205, 208, 209, 211, 212, 216, 217, 218, 220, 221, 22, 3, 225, 226, 227, 229, 230, 231, 233, 235,
       236, 237, 238, 239)


-- 5번
update TBLSTUDENT
set retdate = '2021-05-28'
where STUDENTSEQ in
      (240, 242, 243, 244, 246, 247, 248, 251, 253, 254, 257, 252, 260, 261, 262, 264, 266, 267, 268, 269, 270, 271,
       272, 273, 274, 277);

update TBLSTUDENT
set retdate = '2021-05-28'
where STUDENTSEQ in
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

--6번
update TBLSTUDENT
set retdate = '2021-06-01'
where STUDENTSEQ in
      (42, 44, 50, 55, 62, 70, 74, 76, 77, 79, 87, 96, 98, 102, 278, 279, 281, 282, 283, 284, 285, 286, 292, 293, 294,
       299);

select *
from TBLSTUDENT;

update TBLSTUDENT
set retdate = '2021-06-15'
where STUDENTSEQ in
      (153, 155);


commit;

select *
from tblopencourse;



-- 1 1     01/05   6
-- 2 2     02/08   5.5
-- 3 3     03/29   7
-- 4 4     04/12   5.5
-- 5 5     05/28   6
-- 6 6     06/01   5.5
-- 7 7     07/08   6
-- 8 8     07/28   7
-- 9 9     09/30   5.5
-- 10 10   11/02   6
-- 11 11   12/01   5.5
-----
-- seq_tblclass

create table TBLCLASS
(
    CLASSSEQ      NUMBER not null
        constraint TBLCLASS_PK
            primary key,
    STUDENTSEQ    NUMBER not null
        references TBLSTUDENT,
    OPENCOURSESEQ NUMBER not null
)
-- /'(' or <expression> expected, got '='
-- 1번과정
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 2, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 13, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 17, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 33, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 36, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 39, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 54, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 63, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 69, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 75, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 81, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 83, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 88, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 94, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 95, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 103, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 111, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 117, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 123, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 138, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 141, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 144, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 160, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 162, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 168, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 171, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 176, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 181, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 189, 1);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 192, 1);


--2번 과정
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 7, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 40, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 104, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 106, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 107, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 108, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 109, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 110, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 114, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 115, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 119, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 121, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 122, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 124, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 125, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 127, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 129, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 130, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 132, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 133, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 134, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 137, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 139, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 140, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 143, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 146, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 147, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 149, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 150, 2);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 151, 2);


--3번 과정
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 9, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 156, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 157, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 159, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 161, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 164, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 165, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 166, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 169, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 170, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 172, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 174, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 175, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 177, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 178, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 179, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 180, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 182, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 183, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 186, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 187, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 188, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 190, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 191, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 194, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 195, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 196, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 197, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 198, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 199, 3);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 200, 3);


--4번 과정 누구한명빼야한다? ㄴㄴ
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 22, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 41, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 201, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 202, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 203, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 205, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 208, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 209, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 211, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 212, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 216, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 217, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 218, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 220, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 221, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 223, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 225, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 226, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 227, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 229, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 230, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 231, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 233, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 235, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 236, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 237, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 238, 4);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 239, 4);


--5번과정
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 24, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 240, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 242, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 243, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 244, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 246, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 247, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 248, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 251, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 253, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 254, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 257, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 259, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 260, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 261, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 262, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 264, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 266, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 267, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 268, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 269, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 270, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 271, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 272, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 273, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 274, 5);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 277, 5);

--7번 과정
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 5, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 12, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 16, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 19, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 21, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 23, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 25, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 26, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 27, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 29, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 31, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 34, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 35, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 46, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 48, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 52, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 53, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 56, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 57, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 59, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 71, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 73, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 85, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 86, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 90, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 92, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 93, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 99, 7);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 101, 7);


--16번 과정
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 1, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 4, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 6, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 8, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 10, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 11, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 14, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 18, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 20, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 28, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 30, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 32, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 38, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 43, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 45, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 47, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 49, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 51, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 58, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 60, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 61, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 64, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 65, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 66, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 67, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 68, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 72, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 78, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 80, 16);
insert into tblclass(CLASSSEQ, STUDENTSEQ, OPENCOURSESEQ)
values (SEQ_TBLCLASS.nextval, 82, 16);

commit;

select *
from tblclass;


3,차-- auto-generated definition
create table TBLRATE
(
    RATESEQ        NUMBER not null
        constraint TBLRATE_PK
            primary key,
    ATTENDRATE     NUMBER not null,
    PERFORMRATE    NUMBER not null,
    WRITERATE      NUMBER not null,
    OPENSUBJECTSEQ NUMBER not null
)

insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 1);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 2);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 3);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 4);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 5);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 6);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 7);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 8);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 9);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 10);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 11);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 12);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 19);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 20);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 21);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 22);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 23);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 24);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 25);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 26);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 27);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 28);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 29);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 30);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 31);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 32);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 33);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 36);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 37);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 76);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 77);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 78);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 79);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 80);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 81);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 82);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 83);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 84);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 85);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 86);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 87);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 88);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 89);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 90);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 91);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 92);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 93);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 94);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 95);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 96);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 97);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 98);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 99);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 100);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 101);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 102);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 103);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 104);
insert into tblrate(RATESEQ, ATTENDRATE, PERFORMRATE, WRITERATE, OPENSUBJECTSEQ)
VALUES (seq_tblrate.nextval, 20, 40, 40, 105);

commit;

select *
from TBLOPENSUBJECT;


-- 예제 시험날짜, 개설된 과목 번호
declare
    cursor vcursor is select , basicpay from tblInsa where buseo = '개발부';
    vnum      tblInsa.num%type;
    vbasicpay tblinsa.basicpay%type;
begin
    open vcursor;
    loop
        fetch vcursor into vnum, vbasicpay;
        exit when vcursor%notfound;

        insert into tblBonus(seq, pnum, bonus, regdate)
        values (seqBonus.nextVal, vnum, round(vbasicpay * 0.7), default);

    end loop;
    close vcursor;
end;

https://
www.w3schools.com/
sql/
sql_insert_into_select.asp
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;
select *
from TBLOPENSUBJECT;


CREATE TABLE tblExam
(
    examSeq        number        NOT NULL,
    gradeEnter     varchar2(10)  NULL,
    examFile       varchar2(100) NULL,
    examDate       date          NULL,
    openSubjectSeq number        NOT NULL references tblOpenSubject (openSubjectSeq)
);
alter table tblExam
    add constraint tblExam_pk primary key (examSeq);
select *
from tblexam;

-- 배점 및 시험관리
-- seq = 번호
-- open_subject_seq = 개설과목 번호
-- handwritingTestPoint = 필기시험배점
-- practicalTestPoint = 실기시험배점
-- attendancePoint = 출결배점
-- examFileStatus = 시험문제등록여부
INSERT INTO tblExamManage (seq, open_subject_seq, handwritingTestPoint, practicalTestPoint, attendancePoint,
                           examFileStatus)
VALUES (seq_ExamManage.nextVal, 1, 40, 40, 20, '등록');

-- cannot insert NULL into ("SIST2"."TBLEXAM"."EXAMSEQ")
insert into tblExam(gradeEnter) --<returning clause> or LOG expected, got 'where'
values ('등록완료') where examseq between 1 and 59; --[42000][933] ORA-00933: SQL command not properly ended

update tblexam
set gradeEnter = '등록';
update tblexam
set examFile = '등록';


select *
from tblexam;
commit;

insert into tblExam(examFile)
select filename
from tblexamFile
order by rand() limit;
-- 예를들어 테이블에서 10개의 데이터를 랜덤하게 가져오고 싶다면 다음과 같이 SQL 쿼리문을 쓰면 됩니다.
--
-- >>select cid from restaurant order by rand() limit 10
--
-- 즉 restaurant라는 테이블에서 cid에 해당하는 최대 10개의 데이터를 랜덤으로 추출하라는 명령입니다.

create table tblexamFile
(
    filename varchar2(100)
);
insert into tblexamFile(filename)
values ('자바');
insert into tblexamFile(filename)
values ('오라클');
insert into tblexamFile(filename)
values ('JDBC');
insert into tblexamFile(filename)
values ('HTML');
insert into tblexamFile(filename)
values ('CSS');
insert into tblexamFile(filename)
values ('JavaScript');
insert into tblexamFile(filename)
values ('Servlet');
insert into tblexamFile(filename)
values ('JSP');
insert into tblexamFile(filename)
values ('Spring');
insert into tblexamFile(filename)
values ('Mybatis');
insert into tblexamFile(filename)
values ('아두이노');
insert into tblexamFile(filename)
values ('하둡');
insert into tblexamFile(filename)
values ('React');
insert into tblexamFile(filename)
values ('vue');
insert into tblexamFile(filename)
values ('angular');
insert into tblexamFile(filename)
values ('Node.js');

insert into tblexam(examseq, examdate, OPENSUBJECTSEQ)
select seq_tblexam.nextval, subjectend, OPENSUBJECTSEQ
from tblopensubject
where subjectend is not null
  and SUBJECTEND < sysdate;


commit;
alter table tblexam
    drop column GRADESEQ;

select *
from tblexam;
commit;

create table TBLATTEND
(
    ATTENDSEQ  NUMBER       not null
        constraint TBLATTEND_PK
            primary key,
    INTIME     DATE,
    OUTTIME    DATE,
    ATTENDANCE VARCHAR2(10) not null
        constraint TBLATTEND_ATTENDACE_CK
            check (attendance in ('정상', '지각', '조퇴', '외출', '병가', '기타')),
    REASON     VARCHAR2(10),
    CLASSSEQ   NUMBER       not null
        references TBLCLASS
)
select *
from tblattend;
-- 1 1     01/05시작   6개월
-- 입실 : 8시 분 :40~59사이 초 : 00~59 DBMS_RAND
-- 퇴실 : 6시 분 : 00~20분 초 : 00~59
-- 출결상황 : 정상, 지각, 조퇴, 외출, 병가, 기타

-- 'yyyy/mm/dd:hh24:mi:ss'));
insert into tblattend
values (1, to_date('2021-01-05:08:50:21', 'yyyy-mm-dd:hh24:mi:ss'),
        to_date('2021-01-05:18:03:42', 'yyyy-mm-dd:hh24:mi:ss'), '정상', null, '1');

[22008][1830] ORA-01830: date format picture ends before converting entire input string ORA-06512: at "SYS.STANDARD", line 167 ORA-06512: at line 11 Position: 98
-- [2021-06-01 11:49:10] [23000][1]
-- [2021-06-01 11:49:10] 	ORA-00001: unique constraint (SIST2.TBLATTEND_PK) violated
-- [2021-06-01 11:49:10] 	ORA-06512: at line 18
-- [2021-06-01 11:49:10] Position: 0
declare
    venter date   := '2021-01-05' ;
    vexit  date   := '2021-01-05';
    vseq   number := 2;
begin

    while venter < '2021-01-20'
        loop
        --     1번교육생에 대해서 입실과 퇴실 시간을 입력 attendance는 정상, reason null로 입력
--     루프돌때마다 1일씩 증가
            venter := venter + 1;
            vexit := vexit + 1;
            venter := to_date(round(dbms_random.value(40, 59)), 'mi');
            venter := to_date(round(dbms_random.value(0, 59)), 'ss');
            vexit := to_date(round(dbms_random.value(0, 20)), 'mi');
            vexit := to_date(round(dbms_random.value(0, 59)), 'ss');
            if mod(to_char(venter, 'd'), 7) + 1 in (6, 7) then --주말
                continue;
            end if;
            insert into tblattend values (vseq, venter, vexit, '정상', null, '1');
            vseq := vseq + 1;

        end loop;
end;



declare
    venter date   := '2021-01-05' ;
    vexit  date   := '2021-01-05';
    vseq   number := 2;
begin
    -- https://stackoverflow.com/questions/43613948/how-to-change-the-hour-value-stored-in-oracle-date-variable --날짜바꾸는법
    while venter < '2021-01-20'
        loop
        --     1번교육생에 대해서 입실과 퇴실 시간을 입력 attendance는 정상, reason null로 입력
--     루프돌때마다 1일씩 증가
            venter := venter + 1;
            vexit := vexit + 1;
            -- UPDATE your_table
-- SET value = value + INTERVAL '1' HOUR;
--             [2021-06-01 12:06:37] [65000][6550]
-- [2021-06-01 12:06:37] 	ORA-06550: line 15, column 20:
-- [2021-06-01 12:06:37] 	PLS-00103: Encountered the symbol "=" when expecting one of the following:
-- [2021-06-01 12:06:37] 	   := . ( @ % ;

--             venter := venter + INTERVAL TRUNC(dbms_random.value(40,59)) MINUTE;
            venter := to_date(round(dbms_random.value(40, 59)), 'mi');
            venter := to_date(round(dbms_random.value(0, 59)), 'ss');
            vexit := to_date(round(dbms_random.value(0, 20)), 'mi');
            vexit := to_date(round(dbms_random.value(0, 59)), 'ss');
            --         if mod(to_char(venter, 'd'), 7) + 1 in (6, 7) then --주말
--             continue;
--         end if;
--        insert into tblattend values (vseq, venter, vexit, '정상', null, '1');
            vseq := vseq + 1;
            dbms_output.PUT_LINE(venter);
            dbms_output.PUT_LINE(vexit);
            dbms_output.PUT_LINE(vseq);
        end loop;
end;
commit;

-- Add one hour to the date:
--
-- UPDATE your_table
-- SET value = value + INTERVAL '1' HOUR;
select to_date('2021-01-01', 'mi')
from dual;

/*
 -- https://stackoverflow.com/questions/54496528/random-date-with-time-in-oracle 날짜랜덤

 주말
 SELECT *
FROM mytable
WHERE MOD(TO_CHAR(my_date, 'J'), 7) + 1 IN (6, 7);

 IF condition THEN
   {...statements to execute when condition is TRUE...}
END IF;
 */

SELECT *
FROM mytable
WHERE MOD(TO_CHAR(my_date, 'J'), 7) + 1 IN (6, 7);
to_date
    ('2018-12-03 08:50:00', 'yyyy-mm-dd hh24:mi:ss')
-- 1 1     01/05   6
-- 2 2     02/08   5.5
-- 3 3     03/29   7
-- 4 4     04/12   5.5
-- 5 5     05/28   6
-- 6 6     06/01   5.5
-- 7 7     07/08   6
-- 8 8     07/28   7
-- 9 9     09/30   5.5
-- 10 10   11/02   6
-- 11 11   12/01   5.5
select *
from tblclass;



declare
    vnum number := 1;
begin
    while vnum <= 10
        loop
            dbms_output.put_line(vnum);
            vnum := vnum + 1;
        end loop;
end;



declare
    venter date := to_date('2021-01-01:00:00:00', 'yyyy-mm-dd:hh24:mi:ss');
begin
    venter := trunc(venter) + floor(dbms_random.value(40, 59)) * 'second';
    dbms_output.PUT_LINE(venter);
end;
TRUNC



    (sysdate)
    + NUMTODSINTERVAL( FLOOR(DBMS_RANDOM.VALUE(0,19*60)), 'MINUTE' ),
         1
-- https://stackoverflow.com/questions/62853758/oracle-random-time-and-interval
-- https://stackoverflow.com/questions/62853758/oracle-random-time-and-interval
-- select trunc(sysdate) + floor(dbms_random.value(0, 1) * 19*60*60) * interval '1' second
-- from dual;

-- [23000][1] ORA-00001: unique constraint (SIST2.TBLATTEND_PK) violated ORA-06512: at line 13 Position: 0
[65000][6550] ORA-06550: line 9, column 17: PLS-00103: Encountered the symbol "SELECT" when expecting one of the following:
declare
    venter        date ;
    vexit         date ;
    vseq          number := 1;
    vclassSeq     number := 1;
    vopencouseseq number;
begin
    while vclassSeq <= 146
        loop
            select OPENCOURSESEQ into vopencouseseq from tblclass where classseq = vclassSeq;
            if vopencouseseq = 1 then
                venter := to_date('2021-01-04:08:50:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-01-04:18:10:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 2 then
                venter := to_date('2021-02-07:08:50:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-02-07:18:10:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 3 then
                venter := to_date('2021-03-28:08:50:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-03-28:18:10:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 4 then
                venter := to_date('2021-04-11:08:50:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-04-11:18:10:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 5 then
                venter := to_date('2021-05-27:08:50:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-05-27:18:10:00', 'yyyy-mm-dd:hh24:mi:ss');
            end if;


            while venter < sysdate
                loop
                    venter := venter + 1;
                    vexit := vexit + 1;
                    if mod(to_char(venter, 'd'), 7) + 1 in (1, 2) then --주말
                        continue;
                    end if;
                    insert into tblattend values (vseq, venter, vexit, '정상', null, vclassSeq);

                    vseq := vseq + 1;
                    dbms_output.PUT_LINE(vseq);
                    dbms_output.PUT_LINE(venter);
                end loop;
            vclassSeq := vclassSeq + 1;
        end loop;
end;

select *
from tblattend;
commit;
delete
from tblattend;

commit;

select *
from tblclass
where OPENCOURSESEQ in (16);

select *
from TBLOPENCOURSE;
select *
from tblclass;

2020-05-28 00:00:00,2020-11-28 00:00:00. ---16

declare
    vnum number := 0; --1. 변수 생성 + 초기화
begin
    if vnum > 0 then
        dbms_output.put_line('양수');
    elsif vnum < 0 then -- else if, elsif, elseif 등... 언어마다 다양하게 씀
        dbms_output.put_line('음수');
    else
        dbms_output.put_line('0');
    end if;
end;



declare
    vjikwi    tblinsa.jikwi%type;
    vnum      tblinsa.num%type;
    vbonus    number;
    vbasicpay tblinsa.basicpay%type;
begin
    --1.
    select jikwi, num, basicpay
    into vjikwi, vnum, vbasicpay
    from tblinsa
    where name = '홍길동';
    --2. 직위 보너스 금액 산정
    if vjikwi in ('부장', '과장') then
        vbonus := vbasicpay * 2;
    elsif vjikwi = '대리' or vjiiwi = '사원' then
        vbonus := vbasicpay * 1.5;
    end if;
    --3. 보너스 지급
    insert into tblBonus(seq, pnum, bonus, regdate)
    values (seqbonus.nextval, vnum, vbonus, default);
end;


select *
from TBLOPENCOURSE;



select *
from TBLOPENSUBJECT;


insert into tblopensubject
values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd'),
        to_date('2021-01-05', 'yyyy-mm-dd') + 29, 6, 1);
insert into tblopensubject
values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd') + 30,
        to_date('2021-01-05', 'yyyy-mm-dd') + 46, 10, 1);
insert into tblopensubject
values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd') + 47,
        to_date('2021-01-05', 'yyyy-mm-dd') + 63, 49, 1);
insert into tblopensubject
values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd') + 64,
        to_date('2021-01-05', 'yyyy-mm-dd') + 91, 50, 1);
insert into tblopensubject
values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd') + 92,
        to_date('2021-01-05', 'yyyy-mm-dd') + 120, 36, 1);
declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-08', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-08', 'yyyy-mm-dd');
begin
    while idx <= 29
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT
--     set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 17),
--         subjectend   = startdate
--     where opensubjectseq = 18;
    update TBLOPENSUBJECT
    set subjectstart = initdate,
        subjectend   = startdate
    where opensubjectseq = 13;
end;
21/06/22

rollback;
    (select subjectend + 1 from tblopensubject where opensubjectseq = 1)


select *
from tblopensubject
where OPENCOURSESEQ in (1, 7, 16);


select *
from TBLOPENCOURSE;


--7번과정

insert into TBLOPENSUBJECT
values (13, '2021-07-08', to_date('2021-07-08', 'yyyy-mm-dd') + 29, 26, 7);
insert into TBLOPENSUBJECT
values (14, to_date('2021-07-08', 'yyyy-mm-dd') + 30, to_date('2021-07-08', 'yyyy-mm-dd') + 46, 18, 7);
insert into TBLOPENSUBJECT
values (15, to_date('2021-07-08', 'yyyy-mm-dd') + 47, to_date('2021-07-08', 'yyyy-mm-dd') + 62, 53, 7);
insert into TBLOPENSUBJECT
values (16, to_date('2021-07-08', 'yyyy-mm-dd') + 63, to_date('2021-07-08', 'yyyy-mm-dd') + 90, 7, 7);
insert into TBLOPENSUBJECT
values (17, to_date('2021-07-08', 'yyyy-mm-dd') + 91, to_date('2021-07-08', 'yyyy-mm-dd') + 113, 58, 7);
insert into TBLOPENSUBJECT
values (18, to_date('2021-07-08', 'yyyy-mm-dd') + 114, to_date('2021-07-08', 'yyyy-mm-dd') + 120, 74, 7);

-- 13~18
declare
    idx       number := 0;
    initdate  date   := to_date('2021-07-08', 'yyyy-mm-dd');
    startdate date   := to_date('2021-07-08', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (7, 1) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT
--     set subjectstart = initdate,
--         subjectend   = startdate
--     where opensubjectseq = 13;
    update TBLOPENSUBJECT
    set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 17),
        subjectend   = startdate
    where opensubjectseq = 18;
end;
--         update TBLOPENSUBJECT
--     set subjectstart = initdate,
--         subjectend   = startdate
--     where opensubjectseq = 13;
select *
from TBLOPENSUBJECT
where OPENCOURSESEQ = 7;
commit;


-- 16번
insert into TBLOPENSUBJECT
values (6, '2020-05-28', to_date('2020-05-28', 'yyyy-mm-dd') + 29, 26, 16);
insert into TBLOPENSUBJECT
values (7, to_date('2020-05-28', 'yyyy-mm-dd') + 30, to_date('2020-05-28', 'yyyy-mm-dd') + 46, 18, 16);
insert into TBLOPENSUBJECT
values (8, to_date('2020-05-28', 'yyyy-mm-dd') + 47, to_date('2020-05-28', 'yyyy-mm-dd') + 62, 53, 16);
insert into TBLOPENSUBJECT
values (9, to_date('2020-05-28', 'yyyy-mm-dd') + 63, to_date('2020-05-28', 'yyyy-mm-dd') + 90, 7, 16);
insert into TBLOPENSUBJECT
values (10, to_date('2020-05-28', 'yyyy-mm-dd') + 91, to_date('2020-05-28', 'yyyy-mm-dd') + 110, 13, 16);
insert into TBLOPENSUBJECT
values (11, to_date('2020-05-28', 'yyyy-mm-dd') + 111, to_date('2020-05-28', 'yyyy-mm-dd') + 115, 16, 16);
insert into TBLOPENSUBJECT
values (12, to_date('2020-05-28', 'yyyy-mm-dd') + 116, to_date('2020-05-28', 'yyyy-mm-dd') + 120, 35, 16);

declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-08', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-08', 'yyyy-mm-dd');
begin
    --     29 46 62 90 110 115 120 -- 6~12
    while idx <= 29
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (1, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;

--     update TBLOPENSUBJECT
--     set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 11),
--         subjectend   = startdate
--     where opensubjectseq = 12;
--     end;
        update TBLOPENSUBJECT
    set subjectstart = initdate,
        subjectend   = startdate
    where opensubjectseq = 6
    ;
    end;



select *
from TBLOPENSUBJECT
where OPENCOURSESEQ=16;
commit;





declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-08', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-08', 'yyyy-mm-dd');
begin
    while idx <= 29
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT
--     set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 17),
--         subjectend   = startdate
--     where opensubjectseq = 18;
end;
rollback;
--fadsfasfasdfa

select *
from TBLOPENCOURSE;
--fadsfasfasdfa
select *
from tblopencourse;

declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-08', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-08', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT set subjectstart = (select subjectend +1 from tblopensubject where opensubjectseq =4 ), subjectend = startdate
--     where opensubjectseq=5;
    update tblopencourse set coursestart = initdate, courseend = startdate where OPENCOURSESEQ = 16;
    dbms_output.PUT_LINE(startdate);
end;;
declare
    idx       number := 0;
    initdate  date   := to_date('2021-07-08', 'yyyy-mm-dd');
    startdate date   := to_date('2021-07-08', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT set subjectstart = (select subjectend +1 from tblopensubject where opensubjectseq =4 ), subjectend = startdate
--     where opensubjectseq=5;
    update tblopencourse set coursestart = initdate, courseend = startdate where OPENCOURSESEQ = 7;
    dbms_output.PUT_LINE(startdate);
end;;
declare
    idx       number := 0;
    initdate  date   := to_date('2021-01-05', 'yyyy-mm-dd');
    startdate date   := to_date('2021-01-05', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT set subjectstart = (select subjectend +1 from tblopensubject where opensubjectseq =4 ), subjectend = startdate
--     where opensubjectseq=5;
    update tblopencourse set coursestart = initdate, courseend = startdate where OPENCOURSESEQ = 1;
    dbms_output.PUT_LINE(startdate);
end;
;
declare
    idx       number := 0;
    initdate  date   := to_date('2021-01-05', 'yyyy-mm-dd');
    startdate date   := to_date('2021-01-05', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    update TBLOPENSUBJECT
    set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 4),
        subjectend   = startdate
    where opensubjectseq = 5;
    dbms_output.PUT_LINE(startdate);
end;;
