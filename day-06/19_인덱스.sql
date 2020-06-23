--인덱스
CREATE TABLE members(
    member_id INT,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)-- 기본키는 자동으로 인덱스가 생성됨
);
--인덱스 출력
SELECT TABLE_NAME AS 테이블명,
        INDEX_NAME AS 인덱스명,
        COLUMN_NAME AS 컬럼이름
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'MEMBERS';

SELECT * FROM members
WHERE last_name = 'Harse';

---------인덱스 없는 열 검색
EXPLAIN PLAN FOR --테이블 검색 과정 설명이 만들어짐
SELECT * FROM members
WHERE last_name = 'Harse';

--설명문을 화면에 출력
SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());
-------
--인덱스 있는 열 검색. cost가 적게 듦
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE member_id = 139;

SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());
---


---인덱스 만들기
CREATE INDEX members_last_name_i
ON members(last_name);

EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name = 'Shafto';

SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());


------------------
--인덱스 삭제하기.
--인덱스는 테이블이 삭제되면 같이 삭제됨

DROP INDEX members_last_name_i;

--멀티 인덱스 만들기. 칼럼을 2개 이상 적어주면 됨.

--예제) 위의 문법대로 MEMBERS 테이블의  first_name과 last_name의 멀티 인덱스를 만들어서 
--아래의 그림처럼 의  인덱스들의 조회및   성능평가 결과를 출력하라

CREATE INDEX members_names_i
ON members(last_name, first_name);

EXPLAIN PLAN FOR --테이블 검색 과정 설명이 만들어짐
SELECT * FROM members
WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';
--설명문을 화면에 출력
SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());

