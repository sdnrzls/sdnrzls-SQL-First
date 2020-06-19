-- DML 작업

-- INSERT: 새 행을 입력하기
--1. 실행전 열과 제약조건을 확인 (DESC + 테이블)
DESC departments;

-- 전체 열을 다 입력하는 방법 1
INSERT INTO departments (department_id,department_name,
manager_id,location_id)
VALUES (71,'개발부 1',100,1700);

SELECT*
FROM departments;
commit;

--열의 이름이 없는 경우 전체 열을 다 입력해야함
INSERT INTO departments
VALUES (72,'개발부 2',100,1700);
COMMIT;

-- 열의 순서를 바꿀경우
INSERT INTO departments (department_name,
manager_id,location_id,department_id)
VALUES ('개발부 3',100,1700,73);
COMMIT;

-- 자동으로 널값 입력
INSERT INTO departments (department_id,department_name)
VALUES (74,'개발부 4');
COMMIT;
DESC departments;

-- sysdate 현재날짜 입력
INSERT INTO employees(employee_id,first_name,
last_name,email,hire_date,job_id)
VALUES (1,'홍','길동','hong@naver.com',sysdate,'IT_PROG');
COMMIT;
DESC employees;

--날짜 입력하기
INSERT INTO employees(employee_id,first_name,
last_name,email,hire_date,job_id)
VALUES (2,'강','길동','kang@naver.com',TO_DATE('2020-04-05','YYYY-MM-DD'),'IT_PROG');
COMMIT;

-- 사용자로 부터 입력받기
INSERT INTO departments (department_id,department_name)
VALUES (&id,'&name'); --75, 개발부 5
COMMIT;

-- 테이블 만들기
CREATE TABLE XX_EMP (
    EMPNO number,
    ENAME VARCHAR2(100),
    SAL   number );
COMMIT;
-- 테이블 전체를 카피해서 입력하는 방법   
INSERT INTO XX_EMP(EMPNO,ENAME,SAL)
SELECT employee_id,first_name,salary
FROM employees;
COMMIT;

--INSERT를 실행중에 에러가 나는경우
--1.기본키에 이미 있는 (중복된) 값을 입력할 경우
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(10,'개발부 10',100,1700);
--2. FK(외래키)에 참조되지 않은 값을 입력
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(5,'개발부 5',100,1);
--3.데이터의 종류가 틀릴때
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(5,1234,100,1);
--4.데이터의 사이즈가 맞지 않을때
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(5,'개발부 5 개발부 5 개발부 5 개발부 5 개발부 5 개발부 5',100,'d1');
DESC departments;

--테이블을 카피하기
CREATE TABLE COPY_DEPT
AS
SELECT * FROM departments;


-- 예제 1)departments 테이블에 다음과 같이 각각의 department_id,department_name,
-- manager_id가 200, location_id 가 1700인 행을 3개 입력하시오
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES (273,'sample dept 3',200,1700);
COMMIT;

--예제 2) 테이블을 만든 후 SELECT 문을 이용하여 departments 테이블 내용을 전부 입력
CREATE TABLE copy_departments(department_id number(4,0),
department_name VARCHAR2(30 byte),manager_id NUMBER(6,0),location_id number(4,0));
COMMIT;

INSERT INTO copy_departments
SELECT *
From departments;
COMMIT;



