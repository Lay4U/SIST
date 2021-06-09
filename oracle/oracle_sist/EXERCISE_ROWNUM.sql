--1. tblInsa. 남자 급여(기본급+수당)을 (내림차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)
SELECT *
FROM TBLINSA;

SELECT T.*, ROWNUM
FROM (
         SELECT NAME, BUSEO, JIKWI, (BASICPAY + SUDANG)
         FROM TBLINSA
         WHERE SUBSTR(SSN, 8, 1) = 1
         ORDER BY (BASICPAY + SUDANG) DESC
     ) T;
--2. tblInsa. 여자 급여(기본급+수당)을 (오름차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)
SELECT E.*, ROWNUM
FROM (
         SELECT NAME, BUSEO, JIKWI, (BASICPAY + SUDANG)
         FROM TBLINSA
         WHERE SUBSTR(SSN, 8, 1) = 2
         ORDER BY (BASICPAY + SUDANG) DESC
     ) E;
--3. tblInsa. 여자 인원수가 가장 많은 부서 및 인원수 가져오시오.
SELECT *
FROM TBLINSA;

SELECT T.*, ROWNUM
FROM (
         SELECT BUSEO, COUNT(BUSEO)
         FROM TBLINSA
         WHERE SUBSTR(SSN, 8, 1) = 2
         GROUP BY BUSEO
     ) T
WHERE ROWNUM = 1;


--4. tblInsa. 지역별 인원수 (내림차순)순위를 가져오시오.(city, 인원수)
SELECT CITY, COUNT(CITY)
FROM TBLINSA
GROUP BY CITY
ORDER BY COUNT(CITY) DESC;

--5. tblInsa. 부서별 인원수가 가장 많은 부서 및 인원수 출력.
SELECT *
FROM TBLINSA;
SELECT T.*, ROWNUM
FROM (
         SELECT BUSEO, COUNT(BUSEO)
         FROM TBLINSA
         GROUP BY BUSEO
         ORDER BY COUNT(BUSEO) DESC
     ) T
WHERE ROWNUM = 1;

--6. tblInsa. 남자 급여(기본급+수당)을 (내림차순) 3~5등까지 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)
SELECT T2.*
FROM (
         SELECT T.*, ROWNUM AS RN
         FROM (
                  SELECT NAME, BUSEO, JIKWI, (BASICPAY + SUDANG)
                  FROM TBLINSA
                  ORDER BY (BASICPAY + SUDANG) DESC
              ) T
     ) T2
WHERE RN BETWEEN 3 AND 5;


--7. tblInsa. 입사일이 빠른 순서로 5순위까지만 가져오시오.
SELECT *
FROM TBLINSA;
SELECT T.*, ROWNUM
FROM (
         SELECT *
         FROM TBLINSA T
         ORDER BY IBSADATE
     ) T
WHERE ROWNUM <= 5;


--8. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 가져오시오.
SELECT *
FROM TBLHOUSEKEEPING;
SELECT T2.*, ROWNUM
FROM (
         SELECT T.*, PRICE * QTY
         FROM TBLHOUSEKEEPING T
         ORDER BY PRICE * QTY DESC) T2
WHERE ROWNUM <= 3;


--9. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 가져오시오.

SELECT T2.*
FROM (
         SELECT T.*, ROWNUM AS RN
         FROM (
                  SELECT AVG(BASICPAY)
                  FROM TBLINSA
                  GROUP BY BUSEO
                  ORDER BY AVG(BASICPAY) DESC
              ) T
     ) T2
WHERE RN = 2
;
SELECT BUSEO, AVG(BASICPAY)
FROM TBLINSA
GROUP BY BUSEO
HAVING (AVG(BASICPAY), 2) = (
    SELECT T2.*
    FROM (
             SELECT T.*, ROWNUM AS RN
             FROM (
                      SELECT AVG(BASICPAY)
                      FROM TBLINSA
                      GROUP BY BUSEO
                      ORDER BY AVG(BASICPAY) DESC
                  ) T
         ) T2
    WHERE RN = 2
);
SELECT *
FROM TBLINSA R
WHERE BUSEO = (
    SELECT BUSEO
    FROM TBLINSA
    GROUP BY BUSEO
    HAVING (AVG(BASICPAY), 2) = (
        SELECT T2.*
        FROM (
                 SELECT T.*, ROWNUM AS RN
                 FROM (
                          SELECT AVG(BASICPAY)
                          FROM TBLINSA
                          GROUP BY BUSEO
                          ORDER BY AVG(BASICPAY) DESC
                      ) T
             ) T2
        WHERE RN = 2
    )
)
ORDER BY BASICPAY DESC;

--10. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 가져오시오.
SELECT * FROM TBLTODO;
SELECT T2.*, ROWNUM
FROM (
         SELECT T.*, COMPLETEDATE - ADDDATE
         FROM TBLTODO T
         ORDER BY COMPLETEDATE - ADDDATE
     )T2
WHERE ROWNUM <= 5;


--32. tblInsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마?
SELECT * FROM TBLINSA;

SELECT (BASICPAY + SUDANG)
    FROM(
    SELECT T2.*, ROWNUM AS RN FROM (
         SELECT T.*, (BASICPAY + SUDANG)
         FROM TBLINSA T
        WHERE SUBSTR(T.SSN, 8, 1) = 1
         ORDER BY BASICPAY + SUDANG DESC
     )T2
    )T3
WHERE RN = 3
UNION
SELECT (BASICPAY + SUDANG)
    FROM(
    SELECT T2.*, ROWNUM AS RN FROM (
         SELECT T.*, (BASICPAY + SUDANG)
         FROM TBLINSA T
        WHERE SUBSTR(T.SSN, 8, 1) = 2
         ORDER BY BASICPAY + SUDANG DESC
     )T2
    )T3
WHERE RN = 9
;
SELECT S1.TOTAL - S2.TOTAL
FROM (SELECT (BASICPAY + SUDANG) as TOTAL
      FROM (SELECT T2.*, ROWNUM AS RN
            FROM (SELECT T.*
                  FROM TBLINSA T
                  WHERE SUBSTR(T.SSN, 8, 1) = 1
                  ORDER BY BASICPAY + SUDANG DESC
                 )T2
           ) T3
       WHERE RN = 3
      ) S1 CROSS JOIN
      (SELECT (BASICPAY + SUDANG) AS TOTAL
       FROM (SELECT T2.*, ROWNUM AS RN
             FROM (SELECT T.*
                   FROM TBLINSA T
                   WHERE SUBSTR(T.SSN, 8, 1) = 2
                   ORDER BY BASICPAY + SUDANG DESC
                  ) T2
            ) T3
       WHERE RN = 9
      ) S2;


--70. employees, departments. 커미션(commission_pct)을 가장 많이 받은 상위 4명의
-- 부서명(department_name), 사원명 (first_name), 급여(salary), 커미션(commission_pct) 정보를 가져오시오.
-- 결과는 커미션 을 많이 받는 순서로 가져오되 동일한 커미션에 대해서는 급여가 높은 사원을 먼저 정렬하시오.
SELECT T.*
FROM (
         SELECT D.DEPARTMENT_NAME, E.FIRST_NAME, E.SALARY, E.COMMISSION_PCT
         FROM EMPLOYEES E
                  INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         WHERE COMMISSION_PCT IS NOT NULL
         ORDER BY E.COMMISSION_PCT DESC
     )T
WHERE ROWNUM <= 4
ORDER BY T.COMMISSION_PCT DESC, T.SALARY DESC

;

--72. tblTodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 상위 5개를 가져오시오.
-- 중복문제