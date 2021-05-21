/*
 Hierarchical Query, 계층형 쿼리
 - 오라클 전용
 - 레코드간의 관계가 서로 상하 수지 구조인 경우 적당한 구조의 결과셋을 만들어 주는 역할
 - 한 테이블에 부모, 자식 레코드가 동시에 있는 경우 > 자기 참조 테이블

 컴퓨터
    - 본체
        - 메인보드
        - 그래픽카드
        - 랜카드
        - cpu
        - 메모리
    - 모니터
        - 보호필름
    - 프린터
        - 잉크카트리지
        - A4용지


 */

CREATE TABLE TBLCOMPUTER
(
    SEQ  NUMBER PRIMARY KEY,
    NAME VARCHAR2(50) NOT NULL,
    QTY  NUMBER       NOT NULL,
    PSEQ NUMBER       NULL REFERENCES TBLCOMPUTER
);


INSERT INTO TBLCOMPUTER
VALUES (1, '컴퓨터', 1, NULL);
INSERT INTO TBLCOMPUTER
VALUES (2, '본체', 1, 1);
INSERT INTO TBLCOMPUTER
VALUES (3, '모니터', 1, 1);
INSERT INTO TBLCOMPUTER
VALUES (4, '프린터', 1, 1);
INSERT INTO TBLCOMPUTER
VALUES (5, '메인보드', 1, 2);
INSERT INTO TBLCOMPUTER
VALUES (6, '그래픽카드', 1, 2);
INSERT INTO TBLCOMPUTER
VALUES (7, '랜카드', 1, 2);
INSERT INTO TBLCOMPUTER
VALUES (8, 'CPU', 1, 2);
INSERT INTO TBLCOMPUTER
VALUES (9, '메모리', 1, 2);
INSERT INTO TBLCOMPUTER
VALUES (10, '보호필름', 1, 3);
INSERT INTO TBLCOMPUTER
VALUES (11, '잉크카트리지', 1, 4);
INSERT INTO TBLCOMPUTER
VALUES (12, 'A4용지', 100, 4);

SELECT *
FROM TBLCOMPUTER;

-- 셀프조인 : 부품 + 부모부품
SELECT C1.NAME AS 부품,
       C2.NAME AS 부모부품
FROM TBLcOMPUTER C1
         INNER JOIN TBLCOMPUTER C2
                    ON C1.PSEQ = C2.SEQ;

SELECT C1.NAME AS 부품,
       C2.NAME AS 부모부품
FROM TBLcOMPUTER C1
         LEFT OUTER JOIN TBLCOMPUTER C2
                         ON C1.PSEQ = C2.SEQ;


-- 계층형 쿼리
-- start with절 + connect by절
-- 계층형 쿼리에서만 사용 가능한 의사 컬럼을 제공
-- prior : 의사컬럼. 부모 레코드
-- LEVEL : 의사컬럼, N세대
SELECT LPAD(' ', (level - 1) * 5) || NAME,
       PRIOR NAME,
       LEVEL
FROM TBLCOMPUTER
-- START WITH SEQ = 1
-- START WITH SEQ = (SELECT SEQ FROM TBLCOMPUTER WHERE NAME = '컴퓨터')
START WITH PSEQ IS NULL
CONNECT BY PRIOR SEQ = PSEQ;


SELECT *
FROM TBLSELF;

SELECT LPAD(' ', (LEVEL - 1) * 2) || NAME AS 직원명,
       DEPARTMENT
FROM TBLSELF
    START WITH SUPER IS NULL
               CONNECT BY SUPER = PRIOR SEQ;

DROP TABLE TBLSELF;
CREATE TABLE TBLSELF(
    SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    DEPARTMENT VARCHAR2(50) NULL,
    SUPER NUMBER NULL REFERENCES TBLSELF(SEQ)
);
INSERT INTO TBLSELF VALUES (1, '홍사장', '영업부', 1);
INSERT INTO TBLSELF VALUES (2, '김부장', '영업부', 2);
INSERT INTO TBLSELF VALUES (3, '이과장', '영업부', 3);
INSERT INTO TBLSELF VALUES (4, '정대리', '영업부', 4);
INSERT INTO TBLSELF VALUES (5, '최사원', '영업부', 5);
INSERT INTO TBLSELF VALUES (6, '박부장', '개발부', 1);
INSERT INTO TBLSELF VALUES (7, '하과장', '개발부', 6);

SELECT LPAD(' ', (LEVEL -1) * 5) || NAME,
       PRIOR NAME,
       LEVEL,
       CONNECT_BY_ROOT NAME AS 루트부품명,
       CONNECT_BY_ISLEAF AS 리프노드,
       SYS_CONNECT_BY_PATH(NAME, '->')
FROM TBLCOMPUTER
START WITH PSEQ IS NULL
           CONNECT BY PRIOR SEQ = PSEQ
ORDER SIBLINGS BY NAME ASC;
-- ORDER BY LPAD(' ', (LEVEL -1) * 5) || NAME

;
