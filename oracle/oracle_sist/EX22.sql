/*
 JOIN
 - 테이블을 합치는 기술
 - 횡(가로, 행) : 테이블의 컬럼과 다른 테이블의 컬럼을 더하는 작업

 UNION
 - UNION, UNION ALL, INTERSECT, MINUS
 - 테이블을 합치는 기술
 - 종(세로, 열) : 테이블의 레코드와 다른 테이블의 레코드를 더하는 작업
 - 수학 집합 개념 지원(합집합, 교집합, 차집합...)
 */

SELECT *
FROM TBLMEN;


SELECT *
FROM TBLWOMEN;


SELECT *
FROM TBLMEN M
         INNER JOIN TBLWOMEN W
                    ON M.COUPLE = W.NAME;

-- DB 연산
-- UNION
-- 1. 컬럼의 개수가 같아야함
-- 2. 순서와 자료형이 같아야함
-- 1 OR 2 == FALSE 이면 UNION 실패

SELECT *
FROM TBLMEN
UNION
SELECT *
FROM TBLWOMEN;

CREATE TABLE TBLUNIONA
(
    COLOR VARCHAR2(30) NOT NULL
);

CREATE TABLE TBLUNIONB
(
    COLOR VARCHAR2(30) NOT NULL
);

INSERT INTO TBLUNIONA
VALUES ('RED');
INSERT INTO TBLUNIONA
VALUES ('YELLOW');
INSERT INTO TBLUNIONA
VALUES ('BLUE');
INSERT INTO TBLUNIONA
VALUES ('BLACK');
INSERT INTO TBLUNIONA
VALUES ('WHITE');

INSERT INTO TBLUNIONB
VALUES ('ORANGE');
INSERT INTO TBLUNIONB
VALUES ('GREEN');
INSERT INTO TBLUNIONB
VALUES ('SKYBLUE');
INSERT INTO TBLUNIONB
VALUES ('YELLOW');
INSERT INTO TBLUNIONB
VALUES ('RED');


-- UNION : 두 테이블을 합쳤을 때 중복되는 행을 자동으로 제거

SELECT *
FROM TBLUNIONA
UNION
SELECT *
FROM TBLUNIONB;

-- 두 테이블을 합쳤을 때 중복되는 행만 포함
SELECT *
FROM TBLUNIONA
UNION ALL
SELECT *
FROM TBLUNIONB;

-- INTERSECT : 두 테이블을 합쳤을 때 중복되는 행만 포함
SELECT *
FROM TBLUNIONA
INTERSECT
SELECT *
FROM TBLUNIONB;

-- MINUS : A - B
SELECT *
FROM TBLUNIONA
MINUS
SELECT *
FROM TBLUNIONB;
