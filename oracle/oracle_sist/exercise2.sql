-- 5. tblMen. tblWomen. 서로 짝이 있는 사람 중 남자와 여자의 정보를 모두 가져오시오.
--    [남자]        [남자키]   [남자몸무게]     [여자]    [여자키]   [여자몸무게]
--    홍길동         180       70            장도연     177        65
--    아무개         175       null          이세영     163        null
--    ..
SELECT M.NAME AS "[남자]",
       M.HEIGHT AS "[남자키]",
       M.WEIGHT AS "[남자몸무게]",
       W.NAME AS "[여자]",
       W.HEIGHT AS "[여자키]",
       W.WEIGHT AS "[여자몸무게]"
FROM TBLMEN M,
     TBLWOMEN W;
-- 23. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 가져오시오.
SELECT S.NAME,
       S.ADDRESS,
       S.SALARY,
       P.PROJECT
FROM TBLSTAFF S,
     TBLPROJECT P
-- 24. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름은?
SELECT DISTINCT M.NAME
FROM TBLVIDEO V ,
     TBLRENT R ,
     TBLMEMBER M
WHERE V.NAME = '뽀뽀할까요'



-- 25. tblStaff, tblProejct. '노조협상'을 담당한 직원의 월급은 얼마인가?
SELECT *
FROM TBLSTAFF S,
     TBLPROJECT P
WHERE P.PROJECT = '노조협상'
AND S.SEQ = P.STAFF_SEQ
;


-- 26. tblVideo, tblRent, tblMember. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름은?
SELECT DISTINCT M.NAME
FROM TBLVIDEO V ,
     TBLRENT R ,
     TBLMEMBER M
WHERE V.NAME = '털미네이터' AND

R.MEMBER = M.SEQ
-- V.SEQ = 3;
;

SELECT * FROM TBLRENT;
-- 27. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의 이름, 월급, 담당프로젝트명을 가져오시오.
SELECT S.NAME,
       S.SALARY,
       P.PROJECT
FROM TBLSTAFF S ,
     TBLPROJECT P
WHERE ADDRESS != '서울시'
;
-- 28. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의 연락처, 이름, 구매상품명, 수량을 가져오시오.
SELECT *
FROM TBLCUSTOMER C ,
     TBLSALES S
-- GROUP BY NAME
;


SELECT *
FROM TBLCUSTOMER C,
     TBLSALES S
WHERE S.SEQ = CSEQ;
-- 29. tblVideo, tblRent, tblGenre. 모든 비디오 제목, 보유수량, 대여가격을 가져오시오.

-- 30. tblVideo, tblRent, tblMember, tblGenre. 2007년 2월에 대여된 구매내역을 가져오시오. 회원명, 비디오명, 언제, 대여가격

-- 31. tblVideo, tblRent, tblMember. 현재 반납을 안한 회원명과 비디오명, 대여날짜를 가져오시오.