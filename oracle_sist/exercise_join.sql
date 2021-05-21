-- 33. employees, departments. 사원들의 이름, 부서번호, 부서명을 가져오시오.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E,
     DEPARTMENTS D
-- 34. employees, jobs. 사원들의 정보와 직위명을 가져오시오.
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       EMAIL,
       PHONE_NUMBER,
       HIRE_DATE,
       E.JOB_ID,
       SALARY,
       COMMISSION_PCT,
       MANAGER_ID,
       DEPARTMENT_ID,
       J.JOB_TITLE
FROM EMPLOYEES E
         INNER JOIN JOBS J ON J.JOB_ID = E.JOB_ID;
-- 35. employees, jobs. 직무(job_id)별 최고급여(max_salary) 받는 사원 정보를 가져오시오.

SELECT J.JOB_ID,
       MAX(SALARY)
FROM EMPLOYEES E
         INNER JOIN JOBS J ON J.JOB_ID = E.JOB_ID
-- WHERE E.EMPLOYEE_ID = (SELECT E)
GROUP BY J.JOB_ID
HAVING MAX(E.SALARY) = (
    SELECT MAX(SALARY)
    FROM EMPLOYEES
--     GROUP BY JOB_ID
)
;

-- 35. employees, jobs. 직무(job_id)별 최고급여(max_salary) 받는 사원 정보를 가져오시오.

SELECT E.job_id,
       MAX(J.MAX_SALARY)
--        J.MAX_SALARY
FROM EMPLOYEES E,
     JOBS J
GROUP BY E.JOB_ID;
SELECT *
FROM EMPLOYEES;
SELECT *
FROM JOBS;
SELECT *
FROM EMPLOYEES E,
     JOBS J
GROUP BY E.JOB_ID
HAVING
    )

SELECT *
FROM EMPLOYEES E,
     JOBS J
WHERE (E.JOB_ID, MAX_SALARY) = (
    SELECT E.JOB_ID,
           J.MAX_SALARY
    FROM EMPLOYEES E,
         JOBS J
)
;

SELECT *
FROM EMPLOYEES;
-- 36. departments, locations. 모든 부서와 각 부서가 위치하고 있는 도시의 이름을 가져오시오.
SELECT *
FROM DEPARTMENTS D,
     LOCATIONS S
;
SELECT DEPARTMENT_NAME, CITY
FROM DEPARTMENTS D,
     LOCATIONS S
WHERE D.LOCATION_ID = S.LOCATION_ID
;


-- 37. locations, countries. location_id 가 2900인 도시가 속한 국가 이름을 가져오시오.
SELECT *
FROM LOCATIONS L,
     COUNTRIES C
WHERE LOCATION_ID = 2900
  AND L.COUNTRY_ID = C.COUNTRY_ID;
-- 38. employees. 급여를 12000 이상 받는 사원과 같은 부서에서 근무하는 사원들의 이름, 급여, 부서번호를 가져오시오.
SELECT DEPARTMENT_ID
FROM EMPLOYEES E1
WHERE SALARY >= 12000;

SELECT FIRST_NAME || ' ' || LAST_NAME AS NAME,
       SALARY,
       DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >= 12000
  AND DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM EMPLOYEES E1
    WHERE SALARY >= 12000
)
ORDER BY DEPARTMENT_ID ASC;


-- 39. employees, departments. locations.  'Seattle'에서(LOC) 근무하는 사원의 이름, 직위, 부서번호, 부서이름을 가져오시오.
SELECT *
FROM EMPLOYEES E,
     DEPARTMENTS D,
     LOCATIONS L
WHERE CITY = 'Seattle'
  AND E.EMPLOYEE_ID = D.DEPARTMENT_ID
  AND D.LOCATION_ID = L.LOCATION_ID
;

-- 40. employees, departments. first_name이 'Jonathon'인 직원과 같은 부서에 근무하는 직원들 정보를 가져오시오.
SELECT *
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND D.DEPARTMENT_ID = (
    SELECT DISTINCT E.DEPARTMENT_ID
    FROM EMPLOYEES E,
         DEPARTMENTS D
    WHERE FIRST_NAME = 'Jonathon'
)
-- 41. employees, departments. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 출력하는데 월급이 3000이상인 사원을 가져오시오.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS 이름,
       D.DEPARTMENT_NAME,
       E.SALARY
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.SALARY >= 3000
;
-- 42. employees, departments. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름, 월급을 가져오시오.
SELECT D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME,
       E.SALARY
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
  AND E.DEPARTMENT_ID = 10;
-- 43. employees, departments. 모든 부서의 정보를 가져오되 부서장이 있는 부서는 부서장의 정보도 같이 가져오시오.
SELECT D.DEPARTMENT_ID,
       DEPARTMENT_NAME,
       D.MANAGER_ID,
       LOCATION_ID
FROM EMPLOYEES E
         RIGHT JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
-- WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
;

SELECT *
FROM DEPARTMENTS;

SELECT *
FROM EMPLOYEES;
-- 44. departments, job_history. 퇴사한 사원의 입사일, 퇴사일, 근무했던 부서 이름을 가져오시오.
SELECT *
FROM DEPARTMENTS D;
SELECT *
FROM JOB_HISTORY;

SELECT *
FROM DEPARTMENTS D,
     JOB_HISTORY J
WHERE D.DEPARTMENT_ID = J.DEPARTMENT_ID;

-- 퇴사한 사원의 입사일, 퇴사일, 근무했던 부서 이름
SELECT J.START_DATE, J.END_DATE, D.DEPARTMENT_NAME
FROM DEPARTMENTS D
         INNER JOIN JOB_HISTORY J ON D.DEPARTMENT_ID = J.DEPARTMENT_ID;

-- 45. employees. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호', '사원이름', '관리자번호', '관리자이름'으로 하여 가져오시오.
SELECT *
FROM EMPLOYEES;


SELECT E1.EMPLOYEE_ID                       AS 사원번호,
       E1.FIRST_NAME || ' ' || E1.LAST_NAME AS 사원이름,
       E1.MANAGER_ID                        AS 관리자번호,
       E2.FIRST_NAME || ' ' || E2.LAST_NAME AS 관리자이름
FROM EMPLOYEES E2,
     EMPLOYEES E1
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID;


-- 46. employees, jobs. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 가져오시오. 년도를 기준으로 오름차순 정렬.
SELECT *
FROM EMPLOYEES;
SELECT *
FROM JOBS;

SELECT TO_CHAR(HIRE_DATE, 'YYYY')
FROM EMPLOYEES E
         INNER JOIN JOBS J on J.JOB_ID = E.JOB_ID
WHERE J.JOB_TITLE = 'Sales Manager'
;
SELECT TO_CHAR(HIRE_DATE, 'YYYY'), AVG(SALARY)
FROM EMPLOYEES E
         INNER JOIN JOBS J on J.JOB_ID = E.JOB_ID
WHERE J.JOB_TITLE = 'Sales Manager'
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY TO_CHAR(HIRE_DATE, 'YYYY') ASC
;


-- 47. employees, departments. locations. 각 도시(city)에 있는 모든 부서 사원들의 평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 사원수를 가져오시오. 단, 도시에 근 무하는 사원이 10명 이상인 곳은 제외하고 가져오시오.
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM LOCATIONS;

-- 각 도시를 그룹으로 묶고, 평균 급여 구하기, 정렬 내림차순
SELECT L.CITY, ROUND(AVG(E.SALARY))
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.CITY
ORDER BY AVG(E.SALARY);

-- 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 사원수를 가져오시오. 단, 도시에 근 무하는 사원이 10명 이상인 곳은 제외하고 가져오시오.
SELECT L.CITY,
       ROUND(AVG(E.SALARY)),
       COUNT(*)
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.CITY
HAVING COUNT(*) >= 10
ORDER BY AVG(E.SALARY);



-- 48. employees, jobs, job_history. ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 가져오시오.
-- 현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 말것
SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;
SELECT *
FROM JOB_HISTORY;

SELECT *
FROM EMPLOYEES E
         INNER JOIN JOBS J on E.JOB_ID = J.JOB_ID
         INNER JOIN JOB_HISTORY JH on J.JOB_ID = JH.JOB_ID
-- WHERE  JOB TITLE로 뭐를 비교해야 퇴직자 정보를 가져오지? JOB TITLE과 비교할만한 컬럼이 다른 테이블에 존재치 않음..... 그냥 EMPLOYEE_ID로 가져오겠음.. 일단..
WHERE JH.EMPLOYEE_ID = E.EMPLOYEE_ID
-- AND JH.DEPARTMENT_ID = E.DEPARTMENT_ID
;


-- 49. employees, departments, locations. 커미션을 받는 모든 사람들의 first_name, last_name, 부서명, 지역 id, 도시명을 가져오시오.
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

SELECT *
FROM LOCATIONS;

-- 커미션을 받는 모든 사람들의 first_name, last_name, 부서명, 지역 id, 도시명을 가져오시오.
SELECT E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_NAME,
       D.LOCATION_ID,
       L.CITY
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
WHERE E.COMMISSION_PCT IS NOT NULL
;

-- 50. employees. 자신의 매니저보다 먼저 고용된 사원들의 first_name, last_name, 고용일을 가져오시오.
SELECT *
FROM EMPLOYEES;

-- 매니저 구하기
SELECT EMPLOYEE_ID,
       MANAGER_ID
FROM EMPLOYEES;

-- 매니저의 입사일
-- SELECT E1.HIRE_DATE, E1.MANAGER_ID, E1.EMPLOYEE_ID AS ME, E2.EMPLOYEE_ID AS MANAGER, E2.HIRE_DATE
SELECT E1.FIRST_NAME,
       E1.LAST_NAME,
       E1.HIRE_DATE
FROM EMPLOYEES E1,
     EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
  AND E1.HIRE_DATE < E2.HIRE_DATE
;


-- 51. employees. 매니저로 근무하는 사원이 총 몇명인가?
SELECT *
FROM EMPLOYEES;

SELECT COUNT(DISTINCT MANAGER_ID)
FROM EMPLOYEES;
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES;
-- 52. employees. 자신의 매니저보다 연봉(salary)를 많이 받는 사원들의 성(last_name)과 연봉(salary)를 가져오시오.
SELECT *
FROM EMPLOYEES;

SELECT E1.LAST_NAME,
       E1.SALARY
FROM EMPLOYEES E1,
     EMPLOYEES E2
WHERE E1.MANAGER_ID = E2.EMPLOYEE_ID
  AND E1.SALARY > E2.SALARY;


-- 53. employees. 총 사원 수 및 2003, 2004, 2005, 2006 년도 별 고용된 사원들의 총 수를 가져오시오.
SELECT *
FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'YYYY')
FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
HAVING TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2003 AND 2006;

-- 54. employees, departments. 2007년에 입사(hire_date)한 사원들의 사번(employee_id), 이름(first_name), 성(last_name), 부서명(department_name)을 가져오시오.
-- 단, 부서에 배치되지 않은 사원은 'Not Assigned'로 가져오시오.
SELECT *
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;

SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.LAST_NAME,
--        CASE
--            WHEN E.DEPARTMENT_ID = NULL THEN 'NOT ASSIGNED'
--             WHEN E.DEPARTMENT_ID != NULL THEN E.DEPARTMENT_ID
-- END
       DECODE(E.DEPARTMENT_ID, NULL, 'NOT ASSIGNED', E.DEPARTMENT_ID) AS DEPARTMENT_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE TO_CHAR(E.HIRE_DATE, 'YYYY') = 2007;

-- 55. employees. 직업이 'AD_PRESS' 인 사람은 A 등급을, 'ST_MAN' 인 사람은 B 등급을, 'IT_PROG' 인 사람은 C 등급을, 'SA_REP' 인 사람은 D 등급을,
-- 'ST_CLERK' 인 사람은 E 등급을 기타는 0 을 부여하여 가져오시오.
SELECT *
FROM EMPLOYEES;

SELECT JOB_ID,
       CASE
           WHEN JOB_ID = 'AD_PRESS' THEN 'A'
           WHEN JOB_ID = 'ST_MAN' THEN 'B'
           WHEN JOB_ID = 'IT_PROG' THEN 'C'
           WHEN JOB_ID = 'SA_REP' THEN 'D'
           WHEN JOB_ID = 'ST_CLERK' THEN 'E'
           ELSE '0'
           END AS GRADE
FROM EMPLOYEES;



-- 56. employees, jobs. 업무명(job_title)이 ‘Sales Representative’인 사원 중에서 연봉(salary)이 9,000이상, 10,000 이하인 사원들의
-- 이름(first_name), 성(last_name)과 연봉(salary)를 가져오시오.
SELECT *
FROM EMPLOYEES;
SELECT *
FROM JOBS;

SELECT E.FIRST_NAME,
       E.LAST_NAME,
       E.SALARY
FROM EMPLOYEES E
         INNER JOIN JOBS J on E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE = 'Sales Representative'
  AND E.SALARY BETWEEN 9000 AND 10000;

-- 57. employees, departments. 부서별로 가장 적은 급여를 받고 있는 사원의 이름, 부서이름, 급여를 가져오시오.
-- 이름은 last_name만 가져오고, 부서이름으로 오름차순 정렬하고, 부서가 같은 경우 이름을 기준 으로 오름차순 정렬하여 가져오시오.
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

SELECT D.DEPARTMENT_NAME,
       E.LAST_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.SALARY =
      (
          SELECT MIN(E2.SALARY)
          FROM EMPLOYEES E2
          WHERE E.DEPARTMENT_ID = E2.DEPARTMENT_ID
      )
GROUP BY D.DEPARTMENT_NAME, E.LAST_NAME
ORDER BY D.DEPARTMENT_NAME, E.LAST_NAME



-- 58. employees, departments, locations. 사원의 부서가 속한 도시(city)가 ‘Seattle’인 사원의 이름, 해당 사원의 매니저 이름, 사원 의 부서이름을 가져오시오.
-- 이때 사원의 매니저가 없을 경우 ‘없음’이라고 가져오시오. 이름은 last_name만 가져오고, 사원의 이름을 오름차순으로 정렬하시오.
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM LOCATIONS;

SELECT E.LAST_NAME,
       (
           SELECT LAST_NAME
           FROM EMPLOYEES E2
           WHERE E.MANAGER_ID = E2.EMPLOYEE_ID
       ) AS MANGERNAME,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
         INNER JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID
WHERE L.CITY = 'Seattle'
-- AND E.MANAGER_ID = (
--     SELECT EMPLOYEE_ID
--     FROM EMPLOYEES E2
--     WHERE E.MANAGER_ID = E2.EMPLOYEE_ID
--     )


-- 59. employees, jobs. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다.
-- 연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 가져오시오. 단 연봉총합이 30,000보다 큰 업무만 가져오시오.


SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;
SELECT JOB_TITLE,
       SUM(SALARY)
FROM EMPLOYEES E
         INNER JOIN JOBS J on J.JOB_ID = E.JOB_ID
WHERE J.JOB_ID IN (
    SELECT J.JOB_ID
    FROM EMPLOYEES E
             INNER JOIN JOBS J on J.JOB_ID = E.JOB_ID
    GROUP BY J.JOB_ID
)
GROUP BY JOB_TITLE
HAVING SUM(SALARY) >= 30000;



-- 60. employees, departments, locations, jobs. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 업무명(job_title), 부서 명(department_name)을 가져오시오.
-- 단 도시명(city)이 ‘Seattle’인 지역(location)의 부서 (department)에 근무하는 사원을 사원번호 오름차순으로 가져오시오.
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       JOB_ID,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
         INNER JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY = 'Seattle'
ORDER BY E.EMPLOYEE_ID
-- 61. employees. 2001~20003년사이에 입사한 사원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 관리자 이름(fist_name)을 가져오시오.
-- 단, 관리자가 없는 사원정보도 결과에 포함시켜 가져오시오.
SELECT *
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN 2001 AND 2003;
SELECT E1.FIRST_NAME,
       E1.HIRE_DATE,
       E2.EMPLOYEE_ID,
       E2.FIRST_NAME
FROM EMPLOYEES E1
         RIGHT OUTER JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
WHERE TO_CHAR(E1.HIRE_DATE, 'YYYY') BETWEEN 2001 AND 2003;
-- 62. employees, departments. ‘Sales’ 부서에 속한 사원의 이름(first_name), 급여(salary), 부서이름(department_name)을 가져오시오.
-- 단, 급여는 100번 부서의 평균보다 적게 받는 사원 정보만 가져오시오.
SELECT E.FIRST_NAME,
       E.SALARY,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.SALARY < (SELECT AVG(E2.SALARY)
                  FROM EMPLOYEES E2,
                       DEPARTMENTS D2
                  WHERE D2.DEPARTMENT_ID = 100
                  GROUP BY D2.DEPARTMENT_ID
);

SELECT AVG(SALARY)
FROM EMPLOYEES E,
     DEPARTMENTS D
WHERE D.DEPARTMENT_ID = 100;
--     GROUP BY D.DEPARTMENT_ID
SELECT *
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID

-- 63. employees. last_name 에 'u' 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 last_name을 가져오시오.
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES E
WHERE E.LAST_NAME LIKE '%u%'
SELECT E.DEPARTMENT_ID,
       E.LAST_NAME
FROM EMPLOYEES E
WHERE DEPARTMENT_ID IN (
    SELECT DISTINCT DEPARTMENT_ID
    FROM EMPLOYEES E2
    WHERE E2.LAST_NAME LIKE '%u%'
)


-- 64. employees, departments. 부서별 사원들의 최대, 최소, 평균급여를 조회하되,
-- 평균급여가 ‘IT’ 부서의 평균급여보다 많고, ‘Sales’ 부서의 평균보다 적은 부서 정보만 가져오시오.
SELECT E.DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), ROUND(AVG(SALARY))
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID
HAVING AVG(SALARY) >(
    SELECT AVG(SALARY)
    FROM EMPLOYEES E2
    INNER JOIN DEPARTMENTS D2 on E2.DEPARTMENT_ID = D2.DEPARTMENT_ID
    WHERE D2.DEPARTMENT_NAME = 'IT'
    GROUP BY D2.DEPARTMENT_ID
    ) AND
       AVG(SALARY) < (
           SELECT AVG(SALARY)
           FROM EMPLOYEES E3
           INNER JOIN DEPARTMENTS D3 ON E3.DEPARTMENT_ID = D3.DEPARTMENT_ID
           WHERE D3.DEPARTMENT_NAME = 'Sales'
           GROUP BY D3.DEPARTMENT_ID
        )

;
-- 65. employees, departments. 각 부서별로 사원이 한명만 있는 부서만 가져오시오.
-- 단, 사원이 없는 부서에 대해서는 ‘신생부서’라는 문자열을 가져오고,  결과는 부서명이 내림차순으로 정렬되게 하시오.
 SELECT DECODE(COUNT(D.DEPARTMENT_ID),0, '신생부서', D.DEPARTMENT_NAME)AS 부서,
        COUNT(*)
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING COUNT(D.DEPARTMENT_ID) <= 1
ORDER BY D.DEPARTMENT_NAME ASC;

SELECT * FROM DEPARTMENTS;

-- 66. employees, departments. 부서별 입사월별 사원수를 가져오시오.
-- 단, 사원수가 5명 이상인 부서만 가져오고,  결과는 부서이름 순으로 하시오.
-- SELECT D.DEPARTMENT_ID, TO_CHAR(E.HIRE_DATE, 'MM')
SELECT D.DEPARTMENT_NAME, TO_CHAR(E.HIRE_DATE, 'MM'), COUNT(*)
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_ID,TO_CHAR(E.HIRE_DATE, 'MM'), D.DEPARTMENT_NAME
HAVING COUNT(*) >= 5
-- 67. employees, departments, locations, countries. 국가(country_name) 별 도시(city)별 사원수를 가져오시오.
-- 부서정보가 없는 사원은 국가명과 도시명 대신에 ‘부서없음’을 넣어서 가져오시오.
SELECT C2.COUNTRY_NAME, L.CITY, DECODE(D.DEPARTMENT_NAME, NULL, '부서없음', D.DEPARTMENT_NAME) AS 부서
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
INNER JOIN LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
INNER JOIN COUNTRIES C2 on L.COUNTRY_ID = C2.COUNTRY_ID
GROUP BY C2.COUNTRY_NAME, L.CITY, D.DEPARTMENT_NAME, D.DEPARTMENT_ID
-- 68. employees, departments. 각 부서별 최대 급여자의 아이디(employee_id), 이름(first_name), 급여(salary)를 가져오시오.

-- 69. employees. 커미션(commission_pct)별 사원수를 가져오시오. 커미션은 0.2, 0.25는 모두 0.2로, 0.3, 0.35는 0.3 형태로 바꾸시오. 단, 커미션 정보가 없는 사원들도 있는 데 커미션이 없는 사원 그룹은 ‘커미션 없음’으로 바꿔 가져오시오.
