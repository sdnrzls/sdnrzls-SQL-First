-- 한줄의 주석입니다. 단축키는 ctrl + / 
/*
여러줄 주석
을 다는 방법
*/
--1.테이블의 모든행과 열을 읽어오기 *
SELECT * 
FROM departments;

--2. 특정 열만 읽어오기
SELECT department_id, department_name
FROM departments;

--3. 산술 연산자 사용(+,-,*,/)
SELECT employee_id, first_name, salary, salary+100,salary+(salary*0.1)
FROM employees;

--4. null 이란?
-- null은 입력되지 않은 , 사용가능하지 않은, 알수없는 값
-- null값은 제로(0) 또는 공백("")과는 다르다.
SELECT last_name, job_id, salary, commission_pct, commission_pct+10
FROM employees;

--5. 중복된 값 제거 : distinct
SELECT DISTINCT job_id
FROM employees;

--예제1
SELECT employee_id, last_name, first_name
FROM employees;
--예제2
SELECT first_name, salary,  salary*1.1 as 뉴셀러리
FROM employees;
--예제3
SELECT employee_id as 사원번호, first_name as 이름, last_name 성
FROM employees;

--6. 연결 연산자 ( || )
SELECT last_name||' is a '||job_id as "직업 정보"
FROM employees;

SELECT employee_id, first_name||' '||last_name
FROM employees;

--예제4
SELECT employee_id, first_name||' '||last_name, email||'@company.com'
FROM employees;




