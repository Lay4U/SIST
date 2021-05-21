-- ex19_subquery

/*
 메인쿼리 Main Query
 하나의 select(insert, update, delete)로만 구성된 쿼리

 서브 쿼리, Sub Query
 - 하나의 문장에 2개 이상의 select를 추가해서 구성된 쿼리
 - 하나의 쿼리안에 또 다른 쿼리가 들어있는 형태
 - 삽입 위치 : select절, from, where, order by

 - select + select X N
 - insert + select X N
 - update + select X N
 - delete + select X N


 */

--tblcountry 인구수가 가장 많은 나라의 인구수는?
select population
from tblCOuntry;

SELECT MAX(POPULATION)
FROM TBLCOUNTRY;
SELECT NAME
FROM TBLCOUNTRY
WHERE POPULATION = 120660;

SELECT NAME
FROM TBLCOUNTRY
WHERE POPULATION = (
    SELECT MAX(POPULATION)
    FROM TBLCOUNTRY -- 120660
);

SELECT MAX(BASICPAY)
FROM TBLINSA;
SELECT NAME
FROM TBLINSA
WHERE BASICPAY = 2650000;

SELECT NAME
FROM TBLINSA
WHERE BASICPAY = (SELECT MAX(BASICPAY) FROM TBLINSA);

SELECT AVG(BASICPAY)
FROM TBLINSA;
SELECT *
FROM TBLINSA
WHERE BASICPAY > 1556526;
SELECT *
FROM TBLINSA
WHERE BASICPAY > (SELECT AVG(BASICPAY) FROM TBLINSA);

-- 홍길동과 같은 부서에 근무하는 사람들
-- SELECT * FROM TBLINSA WHERE NAME='홍길동';
SELECT BUSEO
FROM TBLINSA
WHERE NAME = '홍길동';
SELECT *
FROM TBLINSA
WHERE BUSEO = (
    SELECT BUSEO
    FROM TBLINSA
    WHERE NAME = '홍길동'
)
  AND NAME <> '홍길동';


-- 서브쿼리의 용도
-- 1. 조건절 비교값으로 사용
-- a. 반환값이 1행 1열 > 단일값, 값 1개 > 스칼라 쿼리(1행 1열) > 연산자사용
-- b  반환값이 N행 1열 > 다중값, 값 N개 > IN 사용(열거형 비교)
-- c  반환값이 1행 N열 > 복합값, 값 N개 > 연산자 사용(N:N) -> MAIN과 SUB의 속성 개수가 같아야함.
-- d  반환값이 N행 N열 > b + c > B와 C 방식을 혼합해서 사용


--  a. 반환값이 1행 1열 > 스칼라 쿼리
-- 1.a
select *
from TBLINSA
WHERE BASICPAY = (SELECT MAX(BASICPAY) FROM TBLINSA);

-- 1.b
-- 급여 260만 이상 받는 사람들이 근무하는 부서의 명단
SELECT *
FROM TBLINSA
WHERE BUSEO IN (
    SELECT BUSEO
    FROM TBLINSA
    WHERE BASICPAY >= 2600000
);

-- 기획부 대리와 같은 지역에 사는 사람들?
select city
from tblinsa
where buseo = '기획부'
  and jikwi = '대리';
SELECT *
FROM TBLINSA
WHERE CITY IN ('서울', '인천', '전남');

SELECT *
FROM TBLINSA
WHERE CITY IN (
    SELECT CITY
    FROM TBLINSA
    WHERE BUSEO = '기획부'
      AND JIKWI = '대리'
);

-- 1.c
-- '홍길동'가 사는 지역과 같은 지역에 살고, 같은 직위를 갖는 직원?
SELECT *
FROM TBLINSA
WHERE NAME = '홍길동'; -- 서울, 부장
SELECT *
FROM TBLINSA
WHERE CITY = '서울'
  AND JIKWI = '부장';


-- 2:2 -> N:N 비교
SELECT *
FROM TBLINSA
WHERE (CITY, JIKWI) = (
    SELECT CITY,
           JIKWI
    FROM TBLINSA
    WHERE NAME = '홍길동'
);

-- 1.d
-- 급여를 260만이상 받는 직원의 부서와 사는곳이 동일한 직원들
SELECT BUSEO, CITY
FROM TBLINSA
WHERE BASICPAY > 2600000;

SELECT *
FROM TBLINSA
WHERE (BUSEO, CITY) IN (
    SELECT BUSEO, CITY
    FROM TBLINSA
    WHERE BASICPAY > 2600000
);


-- 2. 컬럼리스트에서 사용
--  A. 반환행이 1행 1열 > 스칼라 쿼리
--      1. 정적 쿼리(모든 행에 동일한 값을 반환)
--      2. 상관 서브 쿼리(서브 쿼리의 값과 바깥쪽 메인 쿼리의 값을 연계시켜 반환)**********
select name,
       basicpay,
       avg(basicpay)
from tblinsa;

SELECT NAME,
       BASICPAY,
       (SELECT 100 FROM DUAL),
       100
FROM TBLINSA;

SELECT NAME,
       BASICPAY,
       (SELECT ROUND(AVG(BASICPAY)) FROM TBLINSA)
FROM TBLINSA;

SELECT NAME,
       BUSEO,
       (SELECT ROUND(AVG(BASICPAY)) FROM TBLINSA) AS 평균급여,
       (SELECT JIKWI FROM TBLINSA WHERE NAME = '홍길동')
FROM TBLINSA;

SELECT *
FROM TBLMEN;
SELECT *
FROM TBLWOMEN;

SELECT NAME                 AS 남자이름,
       HEIGHT               AS 남자키,
       COUPLE               AS 여자이름,
--        여자테이블의 HEIGTH -> SUBQUERY사용해야함
       (SELECT HEIGHT
        FROM TBLWOMEN
        WHERE NAME = '장도연') AS 여자키
FROM TBLMEN;

SELECT NAME                         AS 남자이름,
       HEIGHT                       AS 남자키,
       COUPLE                       AS 여자이름,
--        (SELECT HEIGHT
--         FROM TBLWOMEN
--         WHERE NAME = '장도연') AS 여자키 -> 정적쿼리
       (SELECT HEIGHT
        FROM TBLWOMEN
        WHERE NAME = TBLMEN.COUPLE) AS 여자키
-- TBMLMEN의 COUPLE값을 서브쿼리에 넣는다. -> 상관쿼리
FROM TBLMEN
WHERE COUPLE IS NOT NULL;

--직원의 이름과 부서명을 가져오시오
SELECT FIRST_NAME || LAST_NAME,
       (SELECT DEPARTMENT_NAME
        FROM DEPARTMENTS D
        WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID) AS 부서명
FROM EMPLOYEES E

--10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?
SELECT JOB
FROM TBLADDRESSBOOK
GROUP BY JOB;

SELECT MAX(COUNT(*))
FROM TBLADDRESSBOOK T
GROUP BY JOB;

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
);

SELECT HOMETOWN, COUNT(*)
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
GROUP BY HOMETOWN
HAVING COUNT(HOMETOWN) = MAX()

SELECT HOMETOWN, COUNT(*)
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
GROUP BY HOMETOWN
HAVING COUNT(HOMETOWN) = (
    );

SELECT HOMETOWN, count(hometown)
FROM TBLADDRESSBOOK
GROUP BY HOMETOWN;

SELECT HOMETOWN
FROM TBLADDRESSBOOK
GROUP BY HOMETOWN
HAVING COUNT(HOMETOWN) = (
    SELECT MAX(COUNT(*))
    FROM TBLADDRESSBOOK
    WHERE JOB = (
        SELECT JOB
        FROM TBLADDRESSBOOK
        GROUP BY JOB
        HAVING COUNT(JOB) = (SELECT MAX(COUNT(*))
                             FROM TBLADDRESSBOOK
                             GROUP BY JOB
        )
    )
    GROUP BY HOMETOWN
);


SELECT HOMETOWN
FROM TBLADDRESSBOOK T2
GROUP BY HOMETOWN
HAVING COUNT(HOMETOWN) = (
    SELECT MAX(COUNT(*))
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
);

--학생
SELECT JOB
FROM TBLADDRESSBOOK
GROUP BY JOB
HAVING COUNT(JOB) = (SELECT MAX(COUNT(*))
                     FROM TBLADDRESSBOOK T
                     GROUP BY JOB
);



SELECT JOB,
       COUNT(*)
FROM TBLADDRESSBOOK T
GROUP BY JOB
ORDER BY COUNT(JOB) DESC;

--
SELECT MAX(COUNT(*))
FROM TBLADDRESSBOOK T
GROUP BY JOB
ORDER BY COUNT(JOB) DESC;



SELECT *
FROM TBLADDRESSBOOK
WHERE (
          SELECT JOB, COUNT(JOB)
          FROM TBLADDRESSBOOK T
--           WHERE COUNT(JOB) = MAX(COUNT(*))
--           GROUP BY JOB
      );

--    SELECT MAX(COUNT(JOB))
SELECT JOB
FROM TBLADDRESSBOOK T
GROUP BY JOB
HAVING COUNT(JOB) = MAX(COUNT(JOB))

SELECT JOB, COUNT(*),
SELECT(MAX(COUNT(JOB))
           FROM TBLADRESSBOOK T2
          )

FROM TBLADDRESSBOOK T
GROUP BY JOB


--13. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?
SELECT *
FROM TBLADDRESSBOOK;



SELECT INSTR(EMAIL, '.'),
--        LENGTH(INSTR(EMAIL, '.')),
       INSTR(EMAIL, '@', 1),
       SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1),
--        INSTR(EMAIL,'@') - INSTR(EMAIL,'.')
       EMAIL
FROM TBLADDRESSBOOK;

SELECT SUBSTR(EMAIL, 1, INSTR(EMAIL, '@', 1) - 1),                                      -- 아이디,
       SUBSTR(EMAIL, INSTR(EMAIL, '@') + 1, INSTR(EMAIL, '.') - INSTR(EMAIL, '@') - 1), -- 도메인
       INSTR(EMAIL, '.'),
       EMAIL
FROM TBLADDRESSBOOK;

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


select job
from tblAddressBook
where hometown = (select hometown
                  from tblAddressBook
                  group by hometown
                  having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown))
group by job
having count(*) = (select max(count(*))
                   from tblAddressBook
                   where hometown = (select hometown
                                     from tblAddressBook
                                     group by hometown
                                     having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown))
                   group by job);


--16. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.

--19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.

--20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 서울과 지방의 비율이 어떻게 되느냐?

--21. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.

--22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%


--38. employees. 급여를 12000 이상 받는 사원과 같은 부서에서 근무하는 사원들의 이름, 급여, 부서번호를 가져오시오.

--40. employees, departments. first_name이 'Jonathon'인 직원과 같은 부서에 근무하는 직원들 정보를 가져오시오.

--61. employees. 2001~2003년사이에 입사한 사원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 관리자 이름(fist_name)을 가져오시오. 단, 관리자가 없는 사원정보도 결과에 포함시켜 가져오시오.

--63. employees. last_name 에 'u' 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 last_name을 가져오시오.

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
GROUP BY HOMETOWN
HAVING COUNT(HOMETOWN) = (SELECT MAX(COUNT(*))
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
                          GROUP BY HOMETOWN);

SELECT MAX(COUNT(*))
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
GROUP BY HOMETOWN
