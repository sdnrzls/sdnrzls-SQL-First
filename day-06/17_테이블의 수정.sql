--제약조건의 추가 및 수정
DROP TABLE class;
CREATE TABLE class (
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);
INSERT INTO class VALUES ('01', '데이터베이스');
INSERT INTO class VALUES ('02', '자바');
SELECT * FROM class;

CREATE TABLE student (
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);
INSERT INTO student VALUES ('0414', '홍길동', '01');
INSERT INTO student VALUES ('0415', '임꺽정', '02');
INSERT INTO student VALUES ('0416', '이순신', '03');
commit;
SELECT * FROM student;

-- 클래스 테이블에 기본키 추가
ALTER TABLE class
ADD CONSTRAINT class_cno_pk PRIMARY KEY (cno);
-- 클래스 테이블에 유니크키 추가
ALTER TABLE class
ADD CONSTRAINT class_cname_uk UNIQUE (cname);

-- 제약조건 조회 명령문
SELECT *
FROM ALL_CONSTRAINTS -- 모든 제약조건
WHERE table_name = 'CLASS'; -- 테이블명 입력(대문자)

-- 학생 테이블에 기본키 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY (sno);
-- 학생 테이블에 sname 에 NOT NULL 추가
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- 학생 테이블에 외래키 추가
ALTER TABLE student
ADD CONSTRAINT student_cno_fk FOREIGN KEY (cno) REFERENCES class (cno);
SELECT * FROM student;

SELECT * FROM class;
UPDATE student SET cno = '01'
WHERE sno= '0416';

-- student 와 class 테이블 삭제
-- 제약조건이 있는 테이블 삭제 CASCADE CONSTRAINT
ALTER TABLE class
DROP CONSTRAINT class_cno_pk;

ALTER TABLE class
DROP CONSTRAINT class_cno_pk CASCADE;

ALTER TABLE class
DROP UNIQUE (canme);

ALTER TABLE student
DROP PRIMARY KEY;


--------------------------------------------------------------
-- 테이블에 컬럼 추가
-- 서브쿼리를 사용해 새 테이블 만들기

--1. 90번 부서의 직원들을 새테이블 E_EMP에 입력하기
CREATE TABLE E_EMP
AS 
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM E_EMP;
DESC E_EMP;

--2. 열의 이름을 지정하여 E_EMP2 생성
CREATE TABLE E_EMP2 ( emp_id, fname, lname, sal, dept_id )
AS
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM e_emp2;

-- 열추가 
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
ADD ( GENDER VARCHAR2(1));

-- 디폴트 값 0
ALTER TABLE E_EMP
ADD ( 커미션  NUMBER default 0 NOT NULL);

ALTER TABLE E_EMP
ADD ( 커미션2  NUMBER default 0 );
-- 한번에 두개의 열 추가
ALTER TABLE E_EMP
ADD ( 날짜  DATE default sysdate,  제작자 VARCHAR2(100) default USER);

SELECT * FROM E_EMP;

----------------------------------------------------------------
-- 열의 수정
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
MODIFY ( 제작자 VARCHAR2(200)); -- 원래(100) => (200)사이즈
DESC E_EMP;

ALTER TABLE E_EMP
MODIFY ( 제작자 VARCHAR2(50)); -- 원래(200) => (50)사이즈

ALTER TABLE E_EMP
MODIFY ( 제작자 VARCHAR2(1)); -- 원래(50) => (1)사이즈

SELECT * FROM E_EMP;

ALTER TABLE E_EMP
MODIFY ( GENDER NUMBER); 

DESC E_EMP;

UPDATE E_EMP
SET 제작자 = NULL;

-----------------------------------------------------
--열의 삭제
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
DROP COLUMN 제작자;  -- 제작자 컬럼 삭제

-- 여러개 열 삭제
ALTER TABLE E_EMP
DROP ( GENDER , 커미션, 커미션2, 날짜 );

---------------------------------------------------
-- 테이블 이름 수정
RENAME E_EMP TO 직원테이블;

-- 테이블의 열 및 이름 수정
SELECT * FROM 직원테이블;

-- 열의 이름을 수정
ALTER TABLE 직원테이블
RENAME column department_id TO 부서번호;

ALTER TABLE 직원테이블
RENAME column salary TO 급여;

ALTER TABLE 직원테이블
RENAME column employee_id TO 직원번호;

-- 예제1) employees 테이블의 job_id 가 'ST_MAN'인 직원들을 새 테이블 stmans를 만들어 입력하라
-- 단 테이블의 컬럼 이름은 id,job,sal(직원테이블의 employee_id,job_id,salary)
CREATE TABLE stmans
as
SELECT employee_id,job_id,salary
FROM employees
where job_id = 'ST_MAN';

ALTER TABLE stmans
RENAME COLUMN employee_id TO id;
ALTER TABLE stmans
RENAME COLUMN job_id TO job;
ALTER TABLE stmans
RENAME COLUMN salary TO sal;

SELECT*FROM stmans;






