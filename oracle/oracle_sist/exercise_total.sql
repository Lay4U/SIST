-- 01. INSA 테이블 전체 레코드 조회
SELECT *
FROM TBLINSA;
-- 02. HR 사용자 소유 테이블 목록 확인
SELECT *
FROM ALL_TABLES;
-- 03. INSA 테이블 구조 확인
DESC TBLINSA;
-- 04. INSA 테이블의 이름(name), 기본급(basicpay) 조회
SELECT NAME, BASICPAY
FROM TBLINSA;
-- 05. INSA 테이블의 이름(name), 기본급(basicpay), 수당(sudang), 기본급+수당 조회
SELECT NAME, BASICPAY, SUDANG, (BASICPAY + SUDANG)
FROM TBLINSA;
-- 06. 이름(name), 출신도(city), 부서명(buseo) 조회. 별명 사용.
SELECT NAME  AS 이름,
       CITY  AS 출신,
       BUSEO AS 부서
FROM TBLINSA;
-- 07. 서울 사람의 이름(name), 출신도(city), 부서명(buseo), 직위(jikwi) 조회
SELECT NAME, CITY, BUSEO, JIKWI
FROM TBLINSA
WHERE CITY = '서울';
-- 08. 출신도가 서울 사람이면서       --> WHERE 구문
--     기본급이 150만원 이상인 사람   --> WHERE 구문
--     조회 (name, city, basicpay, ssn)
SELECT NAME, CITY, BASICPAY, SSN
FROM TBLINSA
WHERE BASICPAY >= 1500000
  AND CITY = '서울';
-- 09. 출신도가 '인천' 이면서, 기본급이 100만원이상 ~ 200만원 미만인 경우만 모든정보 조회.
SELECT *
FROM TBLINSA
WHERE BASICPAY BETWEEN 1000000 AND 2000000
  AND CITY = '인천';
-- 10. 출신도가 서울 사람이거나 부서가 개발부인 자료 조회 (name, city, buseo)
SELECT NAME, CITY, BUSEO
FROM TBLINSA
WHERE CITY = '서울'
   OR BUSEO = '개발부';
-- 11. 출신도가 서울, 경기인 사람만 조회 (name, city, buseo). IN 연산자 사용.
SELECT *
FROM TBLINSA
WHERE CITY IN ('서울', '경기');
-- 12. 부서가 '개발부' 이거나 '영업부'인 사원의 모든정보 조회. IN 연산자 사용.
SELECT *
FROM TBLINSA
WHERE BUSEO IN ('개발부', '영엉부');
-- 13. 급여(basicpay + sudang)가 250만원 이상인 사람 조회. --> WHERE 구문
--     단, 필드명은 한글로 출력. --> 별칭
--     (name, basicpay, sudang, basicpay+sudang)
SELECT NAME              AS 이름,
       BASICPAY          AS 기본급,
       SUDANG            AS 수당,
       BASICPAY + SUDANG AS 급여
FROM TBLINSA
WHERE BASICPAY + SUDANG >= 250

-- 14. 주민번호를 기준으로 남자(성별란이 1, 3)만 조회. (이름(name), 주민번호(ssn)).
--     단, SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) IN (1, 3);


-- 15. 주민번호를 기준으로 80년대 태어난 사람만 출력. (이름(name), 주민번호(ssn)).
--     단, SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 1, 1) = 8;

-- 16. 서울 사람 중에서 70년대 태어난 사람만 출력. SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE CITY = '서울'
  AND SUBSTR(SSN, 1, 1) = 7;

-- 17. 서울 사람 중에서 70년대 태어난 남자만 출력. SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE CITY = '서울'
  AND SUBSTR(SSN, 1, 1) = 7
  AND SUBSTR(SSN, 8, 1) = 1;

-- 18. 서울 사람이면서 김씨만 출력(성씨가 1자라는 가정). (이름, 출신도).
-- SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE NAME LIKE '김__';

-- 19. 2000년도에 입사한 사람 출력. (이름, 출신도, 입사일).
-- SUBSTR() 또는 TO_CHAR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE TO_CHAR(IBSADATE, 'YYYY') BETWEEN 2000 AND 2010;

-- 20. 2000년 10월에 입사한 사람 출력. (이름, 출신도, 입사일).
SELECT *
FROM TBLINSA
WHERE TO_CHAR(IBSADATE, 'YYYY') BETWEEN 2000 AND 2010
  AND TO_CHAR(IBSADATE, 'MM') = 10;

-- 21. 주민번호를 기준으로 직원의 나이 구하기(단, 모든 직원이 1900년대에 태어났다는 가정). (이름, 주민번호, 나이)
SELECT *
FROM TBLINSA;
SELECT NAME,
       SSN,
       2021 - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1900) + 1 AS 나이
FROM TBLINSA;

-- 22. 주민번호 기준으로 현재 나이대가 40대인 사람만 출력.
SELECT *
FROM TBLINSA
WHERE 2021 - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1900) + 1 BETWEEN 40 AND 49;

-- 23. 주민번호 기준으로 5월달생만 출력. SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 3, 2) = 05;

-- 24. 주민번호 기준으로 5월달생만 출력. TO_CHAR() 함수 이용.
-- 문자열 -> 날짜 -> 문자열
SELECT *
FROM TBLINSA
WHERE TO_CHAR(TO_DATE(SUBSTR(TO_CHAR(SSN), 1, 6), 'YYMMDD')) LIKE '__05__'

SELECT SUBSTR(TO_CHAR(SSN), 1, 6)
FROM TBLINSA
WHERE SUBSTR(TO_CHAR(SSN), 1, 6) LIKE '__05__';


-- 25. 출신도 내림차순으로 정렬하고, 출신도가 같으면 기본급 내림차순
SELECT *
FROM TBLINSA
ORDER BY CITY ASC, BASICPAY DESC;

-- 26. 서울 사람 중에서 기본급+수당(->급여) 내림차순으로 정렬.
-- (이름, 출신도, 기본급+수당)
SELECT NAME,
       CITY,
       BASICPAY + SUDANG AS 급여
FROM TBLINSA
WHERE CITY = '서울'
ORDER BY BASICPAY + SUDANG DESC;

-- 27. 여자 중 부서 오름차순으로 정렬하고, 부서가 같으면 기본급 내림차순 정렬. (이름, 주민번호, 부서, 기본급)
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) = 2
ORDER BY BUSEO ASC, BASICPAY DESC;

-- 28. 남자 중에서 나이를 기준으로 오름차순 정렬해서 출력.
SELECT T.*, 2021 - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1900) + 1 AS 나이
FROM TBLINSA T
WHERE SUBSTR(SSN, 8, 1) = 1
ORDER BY 2021 - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1900) + 1 ASC

-- 29. 서울 지역 사람들 중에서 입사일이 빠른 사람을 먼저 출력.
SELECT *
FROM TBLINSA
ORDER BY IBSADATE;

-- 30. 성씨가 김씨가 아닌 사람 출력. (이름, 출신도, 기본급).
SELECT *
FROM TBLINSA
WHERE NAME NOT LIKE '김__'


-- 31. 출신도가 서울, 부산, 대구 이면서
-- 전화번호에 5 또는 7이 포함된 자료 출력하되
-- 부서명의 마지막 부는 출력되지 않도록함.
-- (이름, 출신도, 부서명, 전화번호)
SELECT NAME,
       CITY,
       REPLACE(BUSEO, '부', ''),
       TEL
FROM TBLINSA
WHERE CITY IN ('서울', '부산', '대구')
  AND (INSTR(TEL, '5') <> 0 OR INSTR(TEL, '7') <> 0);


-- 32. 전화번호가 있으면 '-'을 제거하고 출력하고, 없으면 '전화번호없음'을 출력
-- SELECT DECODE(INSTR(TEL, '-'), REPLACE(TEL, '-', ''), '전화번호없음')
SELECT CASE
           WHEN INSTR(TEL, '-') <> 0 THEN REPLACE(TEL, '-', '')
           WHEN TEL IS NULL THEN '전화번호없음'
           END
FROM TBLINSA;
-- 추가문제) HR계정, employees 테이블에서 커미션 받는 사람의 수와
-- 안받는 사람의 수를 출력
SELECT *--COUNT(*)
FROM (SELECT T.*, ROWNUM AS RN
      FROM (
               SELECT COUNT(*)
               FROM EMPLOYEES
               GROUP BY COMMISSION_PCT) T
     ) T2
;

SELECT COUNT(COMMISSION_PCT),
       COUNT(*) - COUNT(COMMISSION_PCT)
FROM EMPLOYEES;


SELECT *
FROM EMPLOYEES;
-- 33. insa 테이블에서 basicpay+sudang가 100만원 미만
-- , 100만원 이상~200만원 미만, 200만원 이상인 직원들의 수 출력.
SELECT *
FROM TBLINSA
GROUP BY (BASICPAY + SUDANG) < 1000000, BASICPAY + SUDANG BETWEEN 1000000 AND 2000000, BASICPAY + SUDANG > 2000000

SELECT *
FROM TBLINSA
GROUP BY (
             SELECT *
             FROM TBLINSA
             WHERE BASICPAY < 1000000),
         (
             SELECT *
             FROM TBLINSA
             WHERE BASICPAY BETWEEN 1000000 AND 2000000
         ),
         (
             SELECT *
             FROM TBLINSA
             WHERE BASICPAY > 2000000
         );

SELECT COUNT(*) AS ONE
FROM TBLINSA
WHERE BASICPAY + SUDANG < 1000000
UNION
SELECT COUNT(*) AS TWO
FROM TBLINSA
WHERE BASICPAY + SUDANG BETWEEN 1000000 AND 2000000
UNION
SELECT COUNT(*) AS THREE
FROM TBLINSA
WHERE BASICPAY + SUDANG > 2000000


-- 34. INSA 테이블에서 주민번호를 가지고 생년월일의 년도별 직원수 출력
SELECT 19 || SUBSTR(SSN, 1, 2) AS YEAR, COUNT(*)
FROM TBLINSA
GROUP BY SUBSTR(SSN, 1, 2);



SELECT 19 || SUBSTR(SSN, 1, 6)
FROM TBLINSA;
-- 35. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 출력.
SELECT SUBSTR(SSN, 1, 6)
FROM TBLINSA
GROUP BY SUBSTR(SSN, 1, 6), SUBSTR(SSN, 3, 2), SUBSTR(SSN, 5, 2)
ORDER BY SUBSTR(SSN, 3, 2) ASC, SUBSTR(SSN, 5, 2) DESC;


-- 36. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 출력.
-- 주의. 입사일은 자료형이 DATE이다.
SELECT *
FROM TBLINSA;
SELECT TO_CHAR(IBSADATE, 'YYMMDD')
FROM TBLINSA
GROUP BY TO_CHAR(IBSADATE, 'YYMMDD'), TO_CHAR(IBSADATE, 'DD'), TO_CHAR(IBSADATE, 'MM')
ORDER BY TO_CHAR(IBSADATE, 'MM') ASC, TO_CHAR(IBSADATE, 'DD') DESC;
-- GROUP BY SUBSTR(IBSADATE,1,10);


-- 37. 전체인원수, 남자인원수, 여자인원수를 동시 출력.
SELECT SUBSTR(SSN, 8, 1), COUNT(*)
FROM TBLINSA
GROUP BY SUBSTR(SSN, 8, 1)

-- 38. 개발부, 영업부, 총무부 인원수 출력. COUNT(), DECODE() 함수 이용.
SELECT BUSEO, COUNT(*)
FROM TBLINSA
WHERE BUSEO IN ('개발부', '영업부', '총무부')
GROUP BY BUSEO;


-- 39. 서울 사람의 남자 인원수 출력.
SELECT *
FROM TBLINSA;
SELECT *
FROM TBLINSA
WHERE CITY = '서울'
  AND SUBSTR(SSN, 8, 1) = 1;


-- 40. 부서가 영업부이고, 남자 인원수, 여자 인원수 출력.  COUNT(), DECODE() 함수 이용.
SELECT SUBSTR(SSN, 8, 1) AS GENDER, COUNT(*)
FROM TBLINSA
WHERE BUSEO = '영업부'
GROUP BY SUBSTR(SSN, 8, 1);

-- 41. 개발부, 영업부, 총무부 인원수 출력. 단, 지역은 '서울'로 한정.
SELECT BUSEO, COUNT(*)
FROM TBLINSA
WHERE CITY = '서울'
  AND BUSEO IN ('개발부', '영업부', '총무부')
GROUP BY BUSEO;

-- 42. 서울 사람의 남자와 여자의 기본급합 출력.
SELECT SUBSTR(SSN, 8, 1), SUM(BASICPAY)
FROM TBLINSA
WHERE CITY = '서울'
GROUP BY SUBSTR(SSN, 8, 1)

-- 43. 남자와 여자의 기본급 평균값 출력. AVG(), DECODE() 함수 이용.
SELECT AVG(DECODE(SUBSTR(SSN, 8, 1), '1', BASICPAY)),
       AVG(DECODE(SUBSTR(SSN, 8, 1), 2, BASICPAY))
FROM TBLINSA


-- 44. 개발부의 남자, 여자 기본급 평균값 출력.
SELECT AVG(DECODE(SUBSTR(SSN, 8, 1), '1', BASICPAY)),
       AVG(DECODE(SUBSTR(SSN, 8, 1), 2, BASICPAY))
FROM TBLINSA
WHERE BUSEO = '개발부';

-- 45. 부서별 남자와 여자 인원수 구하기
SELECT BUSEO, SUBSTR(SSN, 8, 1), COUNT(*)
FROM TBLINSA
GROUP BY BUSEO, SUBSTR(SSN, 8, 1);

-- 46. 지역별 남자와 여자 인원수 구하기
SELECT CITY, SUBSTR(SSN, 8, 1), COUNT(*)
FROM TBLINSA
GROUP BY CITY, SUBSTR(SSN, 8, 1);

-- 47. 입사년도별 남자와 여자 인원수 구하기
SELECT TO_CHAR(IBSADATE, 'YYYY'), SUBSTR(SSN, 8, 1), COUNT(*)
FROM TBLINSA
GROUP BY TO_CHAR(IBSADATE, 'YYYY'), SUBSTR(SSN, 8, 1);

-- 48. 영업부, 총무부 인원만을 가지고 입사년도별 남자와 여자 인원수 구하기
SELECT TO_CHAR(IBSADATE, 'YYYY'), SUBSTR(SSN, 8, 1), COUNT(*)
FROM TBLINSA
WHERE BUSEO IN ('영업부', '총무부')
GROUP BY TO_CHAR(IBSADATE, 'YYYY'), SUBSTR(SSN, 8, 1)

-- 49. 서울 사람중 부서별 남자와 여자인원수, 남자와 여자 급여합 출력.
SELECT BUSEO, SUBSTR(SSN, 8, 1), COUNT(*), SUM(BASICPAY)
FROM TBLINSA
WHERE CITY = '서울'
GROUP BY BUSEO, SUBSTR(SSN, 8, 1)

-- 50. 부서별 인원수 출력. 인원수가 10 이상인 경우만.
SELECT BUSEO, COUNT(BUSEO)
FROM TBLINSA
GROUP BY BUSEO
HAVING COUNT(BUSEO) >= 10;

-- 51. 부서별 남,여 인원수 출력. 여자인원수가 5명 이상인 부서만 출력.
SELECT BUSEO, SUBSTR(SSN, 8, 1)
FROM TBLINSA
GROUP BY BUSEO, SUBSTR(SSN, 8, 1)
HAVING (SUBSTR(SSN, 8, 1) = 2) >= 5;

SELECT BUSEO, SUBSTR(SSN, 8, 1)
FROM TBLINSA
GROUP BY BUSEO, SUBSTR(SSN, 8, 1)
HAVING (BUSEO, SUBSTR(SSN, 8, 1), COUNT(*)) = (
    SELECT BUSEO, SUBSTR(SSN, 8, 1), COUNT(*)
    FROM TBLINSA
    WHERE SUBSTR(SSN, 8, 1) = 2
    GROUP BY BUSEO, SUBSTR(SSN, 8, 1)
);
-- 52. 이름, 성별, 나이 출력
--        성별: 주민번호 1,3->남자, 2,4->여자 (DECODE 사용)
--        나이: 주민번호 이용해서
SELECT NAME,
       DECODE(SUBSTR(SSN, 8, 1), 1, '남자', '여자')       AS 성별,
       2021 - TO_NUMBER(SUBSTR(SSN, 1, 2) + 1900) + 1 AS 나이
FROM TBLINSA


-- 53. 서울 사람 중에서 기본급이 200만원 이상이 사람. (이름, 기본급)
SELECT *
FROM TBLINSA
WHERE CITY = '서울'
  AND BASICPAY >= 2000000

-- 54. 입사월별 인원수 구하기. (월, 인원수)   COUNT, GROUP BY, TO_CHAR 사용
--         출력형태 ----------
--         월      인원수
--         1월    10명
--         2월    25명
SELECT TO_CHAR(IBSADATE, 'MM'), COUNT(*)
FROM TBLINSA
GROUP BY TO_CHAR(IBSADATE, 'MM')

-- 55. 이름, 생년월일, 기본급, 수당을 출력.
--        생년월일은 주민번호 기준 (2000-10-10 형식으로 출력)
--        기본급은 \1,000,000 형식으로 출력
SELECT NAME,
       19 || SUBSTR(SSN, 1, 2) || '-' || SUBSTR(SSN, 3, 2) || '-' || SUBSTR(SSN, 5, 2),
       TO_CHAR(BASICPAY, '9,999,999')
FROM TBLINSA;

-- 56. 이름, 출신도, 기본급을 출력하되 출신도 내림차순 출력(1차 정렬 기준).
-- 출신도가 같으면 기본급 오름차순 출력(2차 정렬 기준).
SELECT NAME, CITY, BASICPAY
FROM TBLINSA
ORDER BY CITY DESC, BASICPAY ASC;

-- 57. 전화번호가 NULL이 아닌것만 출력. (이름, 전화번호)
SELECT *
FROM TBLINSA
WHERE TEL IS NOT NULL;

-- 58. 근무년수가 15년 이상인 사람 출력. (이름, 입사일)
SELECT NAME, IBSADATE
FROM TBLINSA
WHERE (SYSDATE - IBSADATE) / 365 >= 15;

-- 59. 주민번호를 기준으로 75~82년생 출력. (이름, 주민번호, 출신도).
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 1, 2) BETWEEN 75 AND 82;

-- 60. 근무년수가 15~20년인 사람 출력. (이름, 입사일)
SELECT *
FROM TBLINSA
WHERE (SYSDATE - IBSADATE) / 365 BETWEEN 10 AND 15;

-- 61. 김씨, 이씨, 박씨만 출력 (이름, 부서). SUBSTR() 함수 이용.
SELECT *
FROM TBLINSA
-- WHERE NAME LIKE('김__', '이__', '박');
WHERE SUBSTR(NAME, 1, 1) IN ('김', '이', '박')
-- 62. 입사일을 "년-월-일 요일" 형식으로 남자만 출력 (이름, 주민번호, 입사일)
SELECT TO_CHAR(IBSADATE, 'YYYY-MM-DD DAY')
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) = 1;


-- 63. 부서별 직위별 급여합 구하기. (부서, 직위, 급여합)
SELECT BUSEO, JIKWI, SUM(BASICPAY + SUDANG)
FROM TBLINSA
GROUP BY BUSEO, JIKWI;

-- 64. 부서별 직위별 인원수, 급여합, 급여평균 구하기. (부서, 직위, 급여합)
SELECT BUSEO, JIKWI, COUNT(*), AVG(BASICPAY + SUDANG)
FROM TBLINSA
GROUP BY BUSEO, JIKWI;

-- 65. 부서별 직위별 인원수를 구하되 인원수가 5명 이상인 경우만 출력.
SELECT BUSEO, JIKWI, COUNT(*)
FROM TBLINSA
GROUP BY BUSEO, JIKWI
HAVING COUNT(*) >= 5;

-- 66. 2000년에 입사한 여사원. (이름, 주민번호, 입사일)
SELECT *
FROM TBLINSA
WHERE TO_CHAR(IBSADATE, 'YYYY') BETWEEN 2000 AND 2009
  AND SUBSTR(SSN, 8, 1) = 2

-- 67. 성씨가 한 글자(김, 이, 박 등)라는 가정하에 성씨별 인원수 (성씨, 인원수)
SELECT SUBSTR(NAME, 1, 1), COUNT(*)
FROM TBLINSA
GROUP BY SUBSTR(NAME, 1, 1);

-- 68. 출신도(CITY)별 성별 인원수.
SELECT CITY, SUBSTR(SSN, 8, 1), COUNT(*)
FROM TBLINSA
GROUP BY CITY, SUBSTR(SSN, 8, 1);

-- 69. 부서별 남자인원수가 5명 이상인 부서와 남자인원수.
SELECT BUSEO, COUNT(*)
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) = 1
GROUP BY BUSEO
HAVING COUNT(*) >= 5

-- 70. 입사년도별 인원수.
SELECT TO_CHAR(IBSADATE, 'YYYY'), COUNT(*)
FROM TBLINSA
GROUP BY TO_CHAR(IBSADATE, 'YYYY');

-- 71. 전체인원수, 2000년, 1999년, 1998년도에 입사한 인원을 다음의 형식으로 출력.
--         전체 2000 1999 1998
--          60    x    x    x
SELECT COUNT(*)                                            AS 전체,
       COUNT(DECODE(TO_CHAR(IBSADATE, 'YYYY'), '2007', 1)) AS "2000",
       COUNT(DECODE(TO_CHAR(IBSADATE, 'YYYY'), '2008', 2)) AS "1999",
       COUNT(DECODE(TO_CHAR(IBSADATE, 'YYYY'), '2009', 3)) AS "1998"
FROM TBLINSA;
SELECT *
FROM TBLINSA;
-- 72. 아래 형식으로 지역별 인원수 출력.
--         전체 서울  인천  경기
--          60    x     x     x
SELECT COUNT(*)                     AS 전체,
       COUNT(DECODE(CITY, '서울', 1)) AS 서울,
       COUNT(DECODE(CITY, '인천', 1)) AS 인천,
       COUNT(DECODE(CITY, '경기', 1)) AS 경기
FROM TBLINSA;

-- 73. 기본급(basicpay)이 평균 이하인 사원 출력. (이름, 기본급). AVG() 함수. 하위쿼리.
SELECT *
FROM TBLINSA
WHERE BASICPAY < (
    SELECT AVG(BASICPAY)
    FROM TBLINSA
);

-- 74. 기본급 상위 10%만 출력. (이름, 기본급)
SELECT T.*, ROWNUM
FROM (
         SELECT NAME, BASICPAY
         FROM TBLINSA
         ORDER BY BASICPAY DESC
     ) T
WHERE ROWNUM < (
                   SELECT COUNT(*)
                   FROM TBLINSA
               ) / 10;

-- 75.기본급 순위가 5순위까지만 출력
SELECT T.*, ROWNUM
FROM (
         SELECT BASICPAY
         FROM TBLINSA
         ORDER BY BASICPAY DESC
     ) T
WHERE ROWNUM <= 5;

-- 76. 입사일이 빠른 순서로 5순위까지만 출력.
SELECT T.*, ROWNUM
FROM (
         SELECT IBSADATE
         FROM TBLINSA
         ORDER BY IBSADATE
     ) T
WHERE ROWNUM <= 5;

-- 77. 평균 급여보다 많은 급여를 받는 직원 출력
SELECT *
FROM TBLINSA
WHERE BASICPAY + SUDANG > (
    SELECT AVG(BASICPAY + SUDANG)
    FROM TBLINSA
);

-- 78. '이순애' 직원의 급여보다 더 많은 급여를 받는 직원 출력.
SELECT *
FROM TBLINSA
WHERE BASICPAY + SUDANG > (
    SELECT BASICPAY + SUDANG
    FROM TBLINSA
    WHERE NAME = '이순애'
);
-- 79. 총무부의 평균 급여보다 많은 급여를 받는 직원들의 이름, 부서명 출력.
SELECT NAME, BUSEO
FROM TBLINSA
WHERE BASICPAY + SUDANG > (
    SELECT AVG(BASICPAY + SUDANG)
    FROM TBLINSA
    WHERE BUSEO = '총무부'
);

-- 80. 총무부 직원최고 급여보다 더 많은 급여를 받는 직원 정보.
SELECT *
FROM TBLINSA
WHERE BASICPAY + SUDANG > (
    SELECT MAX(BASICPAY + SUDANG)
    FROM TBLINSA
    WHERE BUSEO = '총무부'
);

-- 81. 직원 전체 평균 급여보다 많은 급여를 받는 직원의 수 출력.
SELECT COUNT(*)
FROM TBLINSA
WHERE BASICPAY + SUDANG > (
    SELECT AVG(BASICPAY + SUDANG)
    FROM TBLINSA
);

-- 82. '홍길동' 직원과 같은 부서의 직원 정보.
SELECT *
FROM TBLINSA
WHERE BUSEO = (
    SELECT BUSEO
    FROM TBLINSA
    WHERE NAME = '홍길동'
);

-- 83. '김신애' 직원과 같은 부서, 직위를 가진 직원 정보
SELECT *
FROM TBLINSA
WHERE (BUSEO, JIKWI) = (
    SELECT BUSEO, JIKWI
    FROM TBLINSA
    WHERE NAME = '김신애'
);

-- 84. 부서별 기본급이 가장 높은 사람 출력. (이름, 부서, 기본급)
SELECT NAME, BUSEO, BASICPAY
FROM TBLINSA
WHERE (BASICPAY, BUSEO) IN (
    SELECT MAX(BASICPAY), BUSEO
    FROM TBLINSA
    GROUP BY BUSEO
);

-- 85. 남자 기본급 순위 출력.
-- 여자 기본급 순위 출력.
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) = 1
ORDER BY BASICPAY DESC;

-- 86. 지역(city)별로 급여(기본급+수당) 1순위 직원만 출력.
SELECT *
FROM TBLINSA
WHERE (CITY, BASICPAY + SUDANG) IN (
    SELECT CITY, MAX(BASICPAY + SUDANG)
    FROM TBLINSA
    GROUP BY CITY);

-- 87. 부서별 인원수가 가장 많은 부서 및 인원수 출력.
SELECT T.*, ROWNUM
FROM (
         SELECT BUSEO, COUNT(BUSEO)
         FROM TBLINSA
         GROUP BY BUSEO
         ORDER BY COUNT(BUSEO) DESC
     ) T
WHERE ROWNUM = 1;

-- 88. 지역(city)별 인원수가 가장 많은 지역 및 인원수 출력.
SELECT CITY, COUNT(*)
FROM TBLINSA
GROUP BY CITY
ORDER BY COUNT(*) DESC;

-- 89. 지역(city)별 평균 급여(basicpay+sudang)가
--      가장 높은 지역 및 평균급여 출력.
SELECT AVG(BASICPAY + SUDANG)
FROM TBLINSA
GROUP BY CITY
ORDER BY AVG(BASICPAY + SUDANG) DESC;

-- 90. 여자 인원수가 가장 많은 부서 및 인원수 출력.
SELECT BUSEO, COUNT(*)
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) = 2
GROUP BY BUSEO
ORDER BY COUNT(*);

-- 91. 지역별 인원수 순위 출력.
SELECT CITY, COUNT(*)
FROM TBLINSA
GROUP BY CITY
ORDER BY COUNT(*) DESC;

-- 92. 지역별 인원수 순위 출력하되 5순위까지만 출력.
SELECT T.*, ROWNUM
FROM (
         SELECT CITY, COUNT(*)
         FROM TBLINSA
         GROUP BY CITY
         ORDER BY COUNT(*) DESC
     ) T
WHERE ROWNUM <= 5;

-- 93. 이름, 부서, 출신도, 기본급, 수당, 기본급+수당, 세금, 실수령액 출력
--        세금: 총급여가 250만원 이상이면 2%, 200만원 이상이면 1%, 나머지 0.
--        실수령액: 총급여-세금
--        CASE~END 문 사용.

SELECT NAME,
       BUSEO,
       CITY,
       BASICPAY,
       SUDANG,
       BASICPAY + SUDANG,
       CASE
           WHEN (BASICPAY + SUDANG) >= 2500000 THEN (BASICPAY + SUDANG) * 0.02
           WHEN (BASICPAY + SUDANG) BETWEEN 2000000 AND 2500000 THEN (BASICPAY + SUDANG) * 0.01
           ELSE 0
           END AS TAX,
       CASE
           WHEN (BASICPAY + SUDANG) >= 2500000 THEN (BASICPAY + SUDANG) - (BASICPAY + SUDANG) * 0.02
           WHEN (BASICPAY + SUDANG) BETWEEN 2000000 AND 2500000 THEN (BASICPAY + SUDANG) - (BASICPAY + SUDANG) * 0.01
           ELSE (BASICPAY + SUDANG)
           END AS 실수령액
FROM TBLINSA;
-- 94. 부서별 평균 급여를 출력하되, A, B, C 등급으로 나눠서 출력.
-- 200만원 초과 - A등급
-- 150~200만원 - B등급
-- 150만원 미만 - C등급
SELECT BUSEO,
       CASE
           WHEN AVG(BASICPAY + SUDANG) > 2000000 THEN 'A'
           WHEN AVG(BASICPAY + SUDANG) < 1500000 THEN 'B'
           ELSE 'C'
           END AS GRADE
FROM TBLINSA
GROUP BY BUSEO;

-- 95. 기본급+수당이 가장 많은 사람의 이름, 기본급+수당 출력.
-- MAX() 함수, 하위 쿼리 이용.

SELECT *
FROM TBLINSA
WHERE BASICPAY+SUDANG = (
    SELECT MAX(BASICPAY + SUDANG)
    FROM TBLINSA
);








