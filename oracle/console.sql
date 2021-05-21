-- tblinsa. 부장 몇명?, 과장 몇명?, 대리 몇명?, 사원 몇명?
select *
from tblinsa;
select count(decode(jikwi, '부장', 1)) as 부장,
       count(decode(jikwi, '과장', 2)) as 과장,
       count(decode(jikwi, '대리', 3)) as 대리,
       count(decode(jikwi, '사원', 4)) as 사원
from tblinsa;
-- tblAddressBook. job. 학생 몇명?, 건물주 몇명?
select *
from tbladdressbook;
select count(decode(job, '학생', 1))  as 학생,
       count(decode(job, '건물주', 1)) as 건물주
from tbladdressbook;

-- tblAddressBook. address. 강동구 몇명? 마포구 몇명?
select count(decode(address, '강동구', 1)) as 강동구,
       count(decode(address, '마포구', 1)) as 마포구
from TBLADDRESSBOOK;

select count(distinct job)
from TBLADDRESSBOOK;

select decode(address, '강동구', 123),
       replace(address, '강동구', 123)
from TBLADDRESSBOOK;

select count(case
                 when instr(address, '강동구') > 0 then 1
    END)        as 강동구,
       count(case
                 when instr(address, '마포구') > 0 then 1
           END) as 마포구
from tbladdressbook;

select count(*) - count(decode(instr(address, '강동구'), 0, 1)) as 강동구,
       count(*) - count(decode(instr(address, '마포구'), 0, 1))
from tbladdressBook;

--10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?
SELECT HOMETOWN
FROM TBLADDRESSBOOK T
WHERE T.JOB = (
    SELECT JOB
    FROM TBLADDRESSBOOK
    GROUP BY JOB
    HAVING COUNT(JOB) = (SELECT MAX(COUNT(*))
                         FROM TBLADDRESSBOOK T
                         GROUP BY JOB
    )
)
GROUP BY HOMETOWN;
-- HAVING COUNT(HOMETOWN) = (SELECT MAX(COUNT(*))
--                           FROM TBLADDRESSBOOK T
--                           WHERE T.JOB = (
--                               SELECT JOB
--                               FROM TBLADDRESSBOOK
--                               GROUP BY JOB
--                               HAVING COUNT(JOB) = (SELECT MAX(COUNT(*))
--                                                    FROM TBLADDRESSBOOK T
--                                                    GROUP BY JOB
--                               )
--                           )
--                           GROUP BY HOMETOWN);
--13. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?
SELECT AVG(LENGTH(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@', 1) - 1))),
       SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1)
FROM TBLADDRESSBOOK
GROUP BY SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1);

SELECT SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1),
       AVG(LENGTH(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@', 1) - 1)))
FROM TBLADDRESSBOOK
GROUP BY SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1)
HAVING AVG(LENGTH(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@', 1) - 1))) = (
    SELECT MAX(AVG(LENGTH(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@', 1) - 1))))
--            SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1)
    FROM TBLADDRESSBOOK
    GROUP BY SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1)
);
--14. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 가지고 있는 직업 중 가장 많은 직업은?
SELECT *
FROM TBLADDRESSBOOK;
--1. 평균 나이가 가장 많다. HOMTOWN으로 그룹잡고 결과 38.6875세
SELECT MAX(AVG(AGE))
FROM TBLADDRESSBOOK
GROUP BY HOMETOWN;

-- 2. 평균 나이가 가장 많은 출신을 선택
SELECT HOMETOWN
FROM TBLADDRESSBOOK
GROUP BY HOMETOWN
HAVING AVG(AGE) = (SELECT MAX(AVG(AGE))
                   FROM TBLADDRESSBOOK
                   GROUP BY HOMETOWN);

-- 3. 2번 출신을 만족하는 JOB을 선택
SELECT JOB
FROM TBLADDRESSBOOK
WHERE HOMETOWN = (
    SELECT HOMETOWN
    FROM TBLADDRESSBOOK
    GROUP BY HOMETOWN
    HAVING AVG(AGE) = (SELECT MAX(AVG(AGE))
                       FROM TBLADDRESSBOOK
                       GROUP BY HOMETOWN)
);

-- 4. 3번에서 가장 많은 직업을 택하기 위해 그룹화
SELECT JOB, COUNT(JOB)
FROM TBLADDRESSBOOK
WHERE HOMETOWN = (
    SELECT HOMETOWN
    FROM TBLADDRESSBOOK
    GROUP BY HOMETOWN
    HAVING AVG(AGE) = (SELECT MAX(AVG(AGE))
                       FROM TBLADDRESSBOOK
                       GROUP BY HOMETOWN)
)
GROUP BY JOB
;
-- 5. 4번 중에서 가장 많은 직업은 학생이 5명, HAVING에서 5를 선택토록 한다.
SELECT JOB
FROM TBLADDRESSBOOK
WHERE HOMETOWN = (
    SELECT HOMETOWN
    FROM TBLADDRESSBOOK
    GROUP BY HOMETOWN
    HAVING AVG(AGE) = (SELECT MAX(AVG(AGE))
                       FROM TBLADDRESSBOOK
                       GROUP BY HOMETOWN)
)
GROUP BY JOB
HAVING COUNT(JOB) = (
    SELECT MAX(COUNT(*))
    FROM TBLADDRESSBOOK
    WHERE HOMETOWN = (
        SELECT HOMETOWN
        FROM TBLADDRESSBOOK
        GROUP BY HOMETOWN
        HAVING AVG(AGE) = (SELECT MAX(AVG(AGE))
                           FROM TBLADDRESSBOOK
                           GROUP BY HOMETOWN)
    )
    GROUP BY JOB
)
;


--16. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.
SELECT *
FROM TBLADDRESSBOOK;

-- 1. 남자
SELECT *
FROM TBLADDRESSBOOK
WHERE GENDER = 'm'

-- 2. 평균 나이보다 높은사람만
SELECT *
FROM TBLADDRESSBOOK
WHERE GENDER = 'm'
  AND AGE > (
    SELECT AVG(AGE)
    FROM TBLADDRESSBOOK
    WHERE GENDER = 'm'
    GROUP BY GENDER
);

-- 3. HOMETOWN 이 서울
SELECT *
FROM TBLADDRESSBOOK
WHERE GENDER = 'm'
  AND HOMETOWN = '서울'
  AND AGE > (
    SELECT AVG(AGE)
    FROM TBLADDRESSBOOK
    WHERE GENDER = 'm'
    GROUP BY GENDER
);

-- 4. 직업이 없는경우
SELECT JOB
FROM TBLADDRESSBOOK
GROUP BY JOB
ORDER BY COUNT(JOB) DESC;
-- 학생 취업준비생 건물주자제분 건물주 백수의 경우 직업이 없음

-- 5. 연결
SELECT *
FROM TBLADDRESSBOOK
WHERE GENDER = 'm'
  AND HOMETOWN = '서울'
  AND JOB NOT IN ('학생', '취업준비생', '건물주자제분', '건물주', '백수')
  AND AGE > (
    SELECT AVG(AGE)
    FROM TBLADDRESSBOOK
    WHERE GENDER = 'm'
    GROUP BY GENDER
);

-- 6. 확인
SELECT JOB, COUNT(JOB)
FROM TBLADDRESSBOOK
WHERE GENDER = 'm'
  AND HOMETOWN = '서울'
  AND JOB NOT IN ('학생', '취업준비생', '건물주자제분', '건물주', '백수')
  AND AGE > (
    SELECT AVG(AGE)
    FROM TBLADDRESSBOOK
    WHERE GENDER = 'm'
    GROUP BY GENDER
)
GROUP BY JOB
ORDER BY COUNT(JOB) DESC;
--19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.
SELECT *
FROM TBLADDRESSBOOK;

-- 1. 가장 많은 나이
SELECT *
FROM TBLADDRESSBOOK
WHERE AGE = (
    SELECT MAX(AGE)
    FROM TBLADDRESSBOOK
);

-- 2. 가장 많은 나이 + 가장 몸무게 많이
SELECT *
FROM TBLADDRESSBOOK
WHERE (AGE, WEIGHT) = (
    SELECT MAX(AGE),
           MAX(WEIGHT)
    FROM TBLADDRESSBOOK
);
--결과값 111 최성수

-- 3. 최성수와 같은 직업(구급대원)을 가지는 사람을 가져오시오.
SELECT *
FROM TBLADDRESSBOOK
WHERE JOB = (
    SELECT JOB
    FROM TBLADDRESSBOOK
    WHERE (AGE, WEIGHT) = (
        SELECT MAX(AGE),
               MAX(WEIGHT)
        FROM TBLADDRESSBOOK
    )
);


--20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 서울과 지방의 비율이 어떻게 되느냐?
SELECT *
FROM TBLADDRESSBOOK;

-- 1. 건물주와 건물주 자제분들을 가져온다.
SELECT *
-- SELECT JOB
FROM TBLADDRESSBOOK
WHERE JOB IN ('건물주', '건물주자제분');
-- GROUP BY JOB

-- 2. 서울에 사는 사람
SELECT COUNT(*)
FROM TBLADDRESSBOOK
WHERE ADDRESS LIKE '서울특별시%'
  AND JOB IN ('건물주', '건물주자제분')
UNION
--합집합
-- 2-2. 서울에 살지 않는사람
SELECT COUNT(*)
FROM TBLADDRESSBOOK
WHERE ADDRESS NOT LIKE '서울특별시%'
  AND JOB IN ('건물주', '건물주자제분');

--21. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.
SELECT *
FROM TBLADDRESSBOOK;

-- 1. 동명이인찾기
SELECT *
FROM TBLADDRESSBOOK T1,
     TBLADDRESSBOOK T2
WHERE T1.NAME = T2.NAME;

-- 2. 가장 많은 동명이인 찾기
SELECT T1.NAME, COUNT(*)
FROM TBLADDRESSBOOK T1,
     TBLADDRESSBOOK T2
WHERE T1.NAME = T2.NAME
GROUP BY T1.NAME
ORDER BY COUNT(T1.NAME) DESC;

-- 3.이도윤을 뽑아내기
-- 2. 가장 많은 동명이인 찾기
SELECT COUNT(*)
FROM TBLADDRESSBOOK T1,
     TBLADDRESSBOOK T2
WHERE T1.NAME = T2.NAME
GROUP BY T1.NAME
HAVING COUNT(T1.NAME) = (
    SELECT MAX(COUNT(NAME))
    FROM TBLADDRESSBOOK
    GROUP BY NAME
)
;
-- 2.1 이도윤(25개) 찾기
SELECT MAX(COUNT(T1.NAME))
FROM TBLADDRESSBOOK T1,
     TBLADDRESSBOOK T2
WHERE T1.NAME = T2.NAME
GROUP BY T1.NAME
ORDER BY COUNT(T1.NAME) DESC;

-- 2.2 결합하기
SELECT NAME,
       COUNT(*) AS 동명이인수
FROM TBLADDRESSBOOK T1,
     TBLADDRESSBOOK T2
WHERE T1.NAME = T2.NAME
GROUP BY T1.NAME
HAVING COUNT(T1.NAME) = (
    SELECT MAX(COUNT(T1.NAME))
    FROM TBLADDRESSBOOK T1,
         TBLADDRESSBOOK T2
    WHERE T1.NAME = T2.NAME
    GROUP BY T1.NAME
)
;

--22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%
SELECT *
FROM TBLADDRESSBOOK;

-- 1. 가장 많은 직업
SELECT MAX(COUNT(JOB))
FROM TBLADDRESSBOOK
GROUP BY JOB;

-- 2. 세대
SELECT *
FROM TBLADDRESSBOOK;

SELECT FLOOR(AGE / 10),
       COUNT(FLOOR(AGE / 10))
FROM TBLADDRESSBOOK
GROUP BY FLOOR(AGE / 10);

-- 합치기 //332
SELECT FLOOR(AGE / 10) * 10,
       COUNT(FLOOR(AGE / 10))
FROM TBLADDRESSBOOK
-- WHERE JOB = (SELECT MAX(COUNT(JOB))
WHERE JOB = (SELECT JOB
             FROM TBLADDRESSBOOK
             GROUP BY JOB
             HAVING COUNT(*) = (
                 SELECT MAX(COUNT(*))
                 FROM TBLADDRESSBOOK
                 GROUP BY JOB
             ))
GROUP BY FLOOR(AGE / 10);
--  비율 구하기


--38. employees. 급여를 12000 이상 받는 사원과 같은 부서에서 근무하는 사원들의 이름, 급여, 부서번호를 가져오시오.
SELECT *
FROM EMPLOYEES;

SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME,
       SALARY,
       DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 12000;
--40. employees, departments. first_name이 'Jonathon'인 직원과 같은 부서에 근무하는 직원들 정보를 가져오시오.
SELECT *
FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES E1
WHERE DEPARTMENT_ID = (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES E2
    WHERE E2.FIRST_NAME = 'Jonathon'
);
--61. employees. 2001~2003년사이에 입사한 사원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 관리자 이름(fist_name)을 가져오시오.
-- 단, 관리자가 없는 사원정보도 결과에 포함시켜 가져오시오.
SELECT FIRST_NAME,
       HIRE_DATE,
       EMPLOYEE_ID,
       FIRST_NAME
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2001 AND 2003
UNION
SELECT FIRST_NAME,
       HIRE_DATE,
       EMPLOYEE_ID,
       FIRST_NAME
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2001 AND 2003
  AND MANAGER_ID IS NULL
;

SELECT *
FROM EMPLOYEES;

--63. employees. last_name 에 'u' 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 last_name을 가져오시오.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%u%';

SELECT EMPLOYEE_ID,
       LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LAST_NAME LIKE '%u%');

--66. employees, departments. 부서별 입사월별 사원수를 가져오시오. 단, 사원수가 5명 이상인 부서만 가져오고,  결과는 부서이름 순으로 하시오.
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID,
       TO_CHAR(HIRE_DATE, 'MM'),
       COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'MM')
HAVING COUNT(*) >= 5
ORDER BY DEPARTMENT_ID ASC;


