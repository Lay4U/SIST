/*
 뷰, view
 - DB object중 하나(테이블, 시퀀스, 제약사항, 뷰) -> 데이터베이스 영구 저장
 - 가상 테이블, 뷰 테이블
 - 일종의 테이블 복사본
 - 뷰는 테이블처럼 취급한다.
 - 자주 사용하는 SELECT의 결과를 저장하는 객체(******)
 - 자주 반복하는 SELECT를 만들어서 쿼리를 줄이는 방법
 - 테이블을 직접 사용하는 것에 비해 간편함(구문 단축)

 - 뷰는 SELECT의 결과를 저장하는 객체(X) -> SELECT문 자체를 저장한느 객체(O)
 - SELECT문 자체를 저장
 -


 create view 뷰이름
 as select문

 뷰의 종류
 1. 단순 뷰
 - 하나의 기본 테이블을 사용해서 만든 뷰
 - CRUD 가능성 존재 그래도 R만 사용해야 한다.

 2. 복합 뷰
 - 두개 이상의 기본 테이블을 사용해서 만든 뷰(SUBQUERY, JOIN, UNION....)
 - R만 가능
 */

CREATE VIEW VWINSA
AS
SELECT *
FROM TBLINSA;

SELECT *
FROM TBLINSA
WHERE BUSEO = '기획부';

SELECT *
FROM VWINSA
WHERE BUSEO = '개발부';

DROP VIEW VWINSA;

-- OR RELPACE OBJECT 만들때 편함 없으면 만들고, 있으면 수정(대체)
CREATE OR REPLACE VIEW VWINSA
AS
SELECT *
FROM TBLINSA
WHERE BUSEO = '기획부';

SELECT *
FROM VWINSA;

CREATE OR REPLACE VIEW VWINSAMALESEOUL
AS
SELECT *
FROM TBLINSA
WHERE SUBSTR(SSN, 8, 1) = '1'
  AND CITY = '서울';

SELECT *
FROM VWINSAMALESEOUL;

CREATE OR REPLACE VIEW VWVIDEO
AS
SELECT M.NAME     AS 회원명,
       V.NAME     AS 비디오제목,
       R.RENTDATE AS 대여날짜,
       CASE
           WHEN R.RETDATE IS NULL THEN '반납안함'
           WHEN R.RETDATE IN NOT NULL THEN '반납완료'
       END    AS 반납상태
FROM TBLGENRE G
         INNER JOIN TBLVIDEO V
                    ON G.SEQ = V.GENRE
         INNER JOIN TBLRENT R
                    ON V.SEQ = R.VIDEO
         INNER JOIN TBLMEMBER M
                    ON M.SEQ = R.MEMBER;

INSERT INTO VWVIDEO (회원명, 비디오제목, 대여날짜, 반납상태) VALUES ('홍길동', '해리포터', '2021-05-30', NULL);
DELETE FROM VWVIDEO WHERE 조건;

CREATE OR REPLACE VIEW VWSEOUL
AS
    SELECT * FROM TBLINSA WHERE CITY = '서울';

SELECT * FROM VWSEOUL;

COMMIT;
ROLLBACK;
UPDATE TBLINSA SET CITY='제주' WHERE NUM = 1001;

SELECT * FROM TBLINSA;

SELECT * FROM VWSEOUL;

DELETE FROM TBLINSA WHERE CITY = '서울';

SELECT * FROM TBLINSA;

SELECT * FROM VWSEOUL;

ROLLBACK;

SELECT * FROM VWSEOUL;


-- 뷰 사용시 주의할 점
-- 뷰는 절대로 읽기 전용으로 사용한다.
-- 뷰로 INSERT, UPDATE, DELETE 작업은 금지한다.
-- 테이블로 IUD하고, VIEW로는 하지마..
CREATE OR REPLACE VIEW VWMEN
AS
    SELECT * FROM TBLMEN;


-- 1. SELECT
SELECT * FROM VWMEN;

-- 2.INSERT
INSERT INTO VWMEN(NAME, AGE, HEIGHT, WEIGHT, COUPLE) VALUES('테스트', 20, 175, 65, NULL);

-- 3.UPDATE
UPDATE VWMEN SET AGE = 25 WHERE NAME = '테스트';

-- 4. DELETE
DELETE FROM VWMEN WHERE NAME ='테스트';


-- 인라인 뷰, INLINE VIEW
CREATE OR REPLACE VIEW VWSEOUL
AS
SELECT * FROM TBLINSA WHERE CITY = '서울';

SELECT * FROM VWSEOUL;

-- 서브쿼리 == 인라인 뷰 -> 1회용, CREATE VIEW -> 재사용 가능
SELECT * FROM (SELECT * FROM TBLINSA WHERE CITY = '서울');









































