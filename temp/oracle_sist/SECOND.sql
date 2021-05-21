/*
 형변환 함수
 1. to_char()   : 숫자 -> 문자
 2. to_char()   : 날짜 -> 문자 ****
 3. to_number() : 문자 -> 숫자
 4. to_date     : 문자 -> 날짜 ****

 1. to_char()
 - char to_cahr(숫자컬럼명, 형식문자열)
 형식문자열 구성요소
 a. 9 숫자의 한 자리를 의미함 + 부호자리
 b. 0 빈자리를 0으로 채움을 의미함
 c. $ 달러 표시를 붙여서 출력함
 d. L 지역 단위 화폐 단위 기호를 붙여서 출력함
 e. . 소수점을 표시함
 f. , 천 단위 구분 기호를 표시함
 */

select '@' || 100 || '@',
       '@' || to_char(100) || '@',
       '@' || to_char(100, '99999') || '@',
       '@' || to_char(100, '00000') || '@',
       '@' || ltrim(to_char(100, '00000')) || '@',
       '@' || ltrim(to_char(100, '00000')) || '@'
from dual;

SELECT 100,
       TO_CHAR(100, '$999'),
       TO_CHAR(100, 'L999'),
       '$' || 100
FROM DUAL;

SELECT 123.456                     AS A_,
       TO_CHAR(123.456)            AS A,
       TO_CHAR(123.456, '999.999') AS B,
       TO_CHAR(123.456, '999.9')   AS C, --반올림 ROUND와 유사
       1000000,
       TO_CHAR(1000000, '9,9999,9999')
FROM DUAL;

SELECT SALARY,
       TO_CHAR(SALARY, '$999,999')       AS SAL_$,
       TO_CHAR(SALARY, 'L999,999')       AS SAL_L,
       TO_CHAR(SALARY, '999,999.00')     AS SAL_1,
       TO_CHAR(SALARY, '000,999,999.00') AS SAL_2,
       TO_CHAR(SALARY, '000999999.99')   AS SAL_3,
       TO_CHAR(SALARY, '999,999,00')     AS SAL_4
FROM EMPLOYEES;

/*
 to_char()
 매우중요
 날짜 -> 문자
 char to_char(날짜 칼럼명, '형식문자열')

 형식 문자열 구성 요소
 a. yyyy
 b. yy
 c. month
 d. mon
 e. mm
 f. day
 g. dy
 h. ddd
 i. dd
 j. d
 k. hh(hh12)
 l. hh24
 m. mi
 n. ss
 o. am(pm)
 */

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'YYYY')                                 AS A,
       TO_CHAR(SYSDATE, 'YY')                                   AS B,
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS C,
       TO_CHAR(SYSDATE, 'MON')                                  AS D,
       TO_CHAR(SYSDATE, 'MM')                                   AS E,
       TO_CHAR(SYSDATE, 'DAY')                                  AS F,
       TO_CHAR(SYSDATE, 'DY')                                   AS G,
       TO_CHAR(SYSDATE, 'DDD')                                  AS H,
       TO_CHAR(SYSDATE, 'DD')                                   AS I,
       TO_CHAR(SYSDATE, 'D')                                    AS J,
       TO_CHAR(SYSDATE, 'HH')                                   AS K,
       TO_CHAR(SYSDATE, 'HH24')                                 AS L,
       TO_CHAR(SYSDATE, 'MI')                                   AS M,
       TO_CHAR(SYSDATE, 'SS')                                   AS N,
       TO_CHAR(SYSDATE, 'AM')                                   AS O,
       TO_CHAR(SYSDATE, 'PM')                                   AS P
FROM DUAL;

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM')    AS MM,
       TO_CHAR(SYSDATE, 'MON')   AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD')    AS DD,
       TO_CHAR(SYSDATE, 'DY')    AS DY,
       TO_CHAR(SYSDATE, 'DAY')   AS DAY
FROM DUAL;

SELECT NAME,
       TO_CHAR(IBSADATE, 'YYYY-MM-DD')                                                                      AS B,
--        TO_CHAR(IBSADATE, 'YYYY년MM월DD일') 불가
       TO_CHAR(IBSADATE, 'YYYY') || '년' || TO_CHAR(IBSADATE, 'MM') || '월' || TO_CHAR(IBSADATE, 'DD') || '일' AS C,
       TO_CHAR(IBSADATE, 'HH24:MI:SS')                                                                      AS HMS,
       TO_CHAR(IBSADATE, 'YYYY-MM-DD HH24:MI:SS')                                                           AS YMDHMS
FROM TBLINSA;

-- 조건절에서 사용
SELECT NAME,
       IBSADATE
FROM TBLINSA
-- WHERE IBSADATE >= '2010-01-01' AND IBSADATE <= '2010-12-31';
-- WHERE IBSADATE BETWEEN '2010-01-01' AND '2010-12-31';
-- WHERE IBSADATE BETWEEN '2010-01-01 00:00:00' AND '2010-12-31 23:59:59';

-- WHERE TO_CHAR(IBSADATE, 'YYYY') = '2010';
-- WHERE TO_CHAR(IBSADATE, 'MM') = '05';
-- WHERE TO_CHAR(IBSADATE, 'DAY') = '월요일';
-- WHERE TO_CHAR(IBSADATE, 'DY') = '월'; //운영체제 언어에 종속 -> 숫자로표기
WHERE TO_CHAR(IBSADATE, 'D') = 2;


SELECT '2010-01-01' -- 시분초 00:00:00로 초기
-- 화
FROM DUAL;


SELECT NAME,
       TO_CHAR(IBSADATE, 'YYYY-MM-DD') AS 입사일
FROM TBLINSA
ORDER BY TO_CHAR(IBSADATE, 'YYYY-MM-DD') ASC;

SELECT NAME,
       TO_CHAR(IBSADATE, 'YYYY-MM-DD') AS 입사일,
       CASE
           WHEN TO_CHAR(IBSADATE, 'MM') BETWEEN '03' AND '05' THEN '봄'
           WHEN TO_CHAR(IBSADATE, 'MM') BETWEEN '06' AND '09' THEN '여름'
           WHEN TO_CHAR(IBSADATE, 'MM') BETWEEN '10' AND '11' THEN '가을'
           WHEN TO_CHAR(IBSADATE, 'MM') IN ('12', '01', '02') THEN '겨울'
           END                         AS 계절
FROM TBLINSA
ORDER BY CASE
             WHEN TO_CHAR(IBSADATE, 'MM') BETWEEN '03' AND '05' THEN 1
             WHEN TO_CHAR(IBSADATE, 'MM') BETWEEN '06' AND '09' THEN 2
             WHEN TO_CHAR(IBSADATE, 'MM') BETWEEN '10' AND '11' THEN 3
             WHEN TO_CHAR(IBSADATE, 'MM') IN ('12', '01', '02') THEN 4
             END ASC;

/*
 TO_NUMBER()
 NUMBER TO_NUMBER(문자열)

 */
SELECT '123',
       TO_NUMBER('123'),
       '123' + 123
FROM DUAL;

/*
 TO_DATE()
 DATE TO_DATE(문자열, 형식문자열)

 SQL의 날짜시간 리터럴(상수)
 - 문자열 표기
 - 문맥에 따라 날짜 상수로 인식하기도, 문자열 상수로 인식하기도 한다.

 */

SELECT SYSDATE,
       '2021-05-17',
--        SYSDATE - '2021-01-01' 여기서는 CHAR, 비교 연산에선 DATE
       TO_DATE('2021-05-17', 'YYYY-MM-DD'),
       TO_DATE('2021/05/17', 'YYYY/MM/DD'),
       TO_DATE('2021-05-17', 'YYYY/MM/DD'),
       TO_DATE('2021/05/17', 'YYYY-MM-DD'),
       TO_DATE('20210517', 'YYYYMMDD')
FROM DUAL;

SELECT *
FROM TBLINSA
WHERE IBSADATE > '2010-01-01'; --TO_DATE로 암시적 형변환함.

SELECT * FROM TBLINSA WHERE IBSADATE BETWEEN '2010-01-01' AND '2010-12-31';
SELECT * FROM TBLINSA WHERE TO_CHAR(IBSADATE, 'YYYY') = '2010';
SELECT * FROM TBLINSA WHERE IBSADATE BETWEEN TO_DATE('2010-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2010-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS')

SELECT '14:23:45', TO_DATE('14:23:45', 'HH24:MI:SS') FROM DUAL;


