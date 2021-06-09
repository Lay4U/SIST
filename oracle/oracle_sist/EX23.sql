/*
 PSEUDO

 PSEUDO COLUMN, 의사 컬럼
 - 실제 컬럼은 아닌데 컬럼처럼 행동하는 객체
 - 함수처럼 생각해도 된다.

 ROWNUM
 - 오라클 전용, MS-SQL(top), mySQL(limit)
 - 행번호를 반환하는 컬럼
 - 서브 쿼리에 많이 의존
 - ROWNUM은 주로 FROM절이 호출될때 같이 실행된다.*****************


 */

SELECT *
FROM TBLCOUNTRY;

SELECT C.*,
       ROWNUM
FROM TBLCOUNTRY C
-- WHERE CONTINENT='AS'
;


-- 질문의 조건에 1행이 포함되면 결과O, 포함 안되면 결과 X
select c.*, rownum
from tblcountry c
where rownum = 1;

SELECT C.*, ROWNUM
FROM TBLCOUNTRY C
WHERE ROWNUM <= 5;


SELECT C.*, ROWNUM
FROM TBLCOUNTRY C
WHERE ROWNUM = 5;
SELECT C.*, ROWNUM
FROM TBLCOUNTRY C
WHERE ROWNUM BETWEEN 3 AND 5;
-- 급여를 많이 받는 순으로 1~10등 구하기
SELECT NAME,
       BASICPAY,
       ROWNUM
FROM TBLINSA
ORDER BY BASICPAY DESC
;


SELECT NAME, BASICPAY, ROWNUM
FROM (SELECT NAME, BASICPAY --여기서 서브쿼리가 실행될때마다 FROM에서 ROWNUM을 생성
      FROM TBLINSA
      ORDER BY BASICPAY DESC)
WHERE ROWNUM <= 10
-- ORDER BY ROWNUM DESC
;


-- RNUM : 가운데 쿼리의 ROWNUM : 정적인 번호
-- ROWNUM : 바깥쪽 쿼리의 ROWNUM : 동적인 번호
SELECT NAME, BASICPAY, RNUM, ROWNUM
FROM (SELECT NAME, BASICPAY, ROWNUM AS RNUM
      FROM (SELECT NAME,
                   BASICPAY
            FROM TBLINSA
            ORDER BY BASICPAY DESC))
WHERE RNUM BETWEEN 3 AND 5;
;

-- BASICPAY + SUDANG -> 급여 순위
SELECT NAME, SALARY, RNUM
FROM (
         SELECT NAME, SALARY, ROWNUM AS RNUM
         FROM (
                  SELECT NAME,
                         BASICPAY + SUDANG AS SALARY
                  FROM TBLINSA
                  ORDER BY SALARY DESC
              )
     )
WHERE RNUM BETWEEN 5 AND 10
;

-- 지역별(HOMETOWN) 거주자가 몇명?
SELECT *
FROM TBLADDRESSBOOK;

SELECT HOMETOWN,
       COUNT(*)
FROM TBLADDRESSBOOK
GROUP BY HOMETOWN
ORDER BY COUNT(*) DESC
;

SELECT *
FROM (
         SELECT HOMETOWN,
                CNT,
                ROWNUM AS RNUM
         FROM (SELECT HOMETOWN,
                      COUNT(*) AS CNT
               FROM TBLADDRESSBOOK
               GROUP BY HOMETOWN
               ORDER BY COUNT(*) DESC
              )
     )
WHERE RNUM BETWEEN 3 AND 5
;

-- 직업별 인원수 1~10, 11~20 TBL ADDRESSBOOK
SELECT *
FROM TBLADDRESSBOOK;

SELECT JOB, CNT, ROWNUM
FROM (
         SELECT JOB,
                COUNT(*) AS CNT
         FROM TBLADDRESSBOOK
         GROUP BY JOB
         ORDER BY COUNT(*) DESC
     )
WHERE ROWNUM BETWEEN 1 AND 10;
;


SELECT JOB, CNT, RNUM
FROM (
         SELECT JOB, CNT, ROWNUM AS RNUM
         FROM (
                  SELECT JOB,
                         COUNT(*) AS CNT
                  FROM TBLADDRESSBOOK
                  GROUP BY JOB
                  ORDER BY COUNT(*) DESC
              )

     )
WHERE RNUM BETWEEN 11 AND 20
;