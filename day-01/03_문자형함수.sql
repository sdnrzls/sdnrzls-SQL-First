--문자형 함수는 대소문자 함수와 문자 조작함수로 나눈다.

--1.대소문자 조작 함수 (UPPER, LOWER, INITCAP)
SELECT 1+1
FROM DUAL; -- 듀얼테이블은 연습용 테이블

--LOWER 문자열 소문자,UPPER 문자열 대문자, INITCAP 문자열 첫문자만 대문자 나머지 소문자 변환
SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'), INITCAP('SQL COURES')
FROM DUAL;

--문자함수를 where절에 사용
SELECT employee_id , first_name
FROM employees
where UPPER(first_name)= 'PATRICK';


--2.문자 조작 함수들

--CONCAT (문자열을 합침)
SELECT first_name, last_name, CONCAT(first_name,last_name) 풀네임
FROM employees;

--SUBSTR(열이름,m,n) : m은 시작문자, n은 잘라낼 길이
SELECT employee_id, first_name,
SUBSTR(first_name, 1, 3)
, SUBSTR(first_name, 2, 4)
, SUBSTR(first_name, 2) --시작부터 끝까지
, SUBSTR(first_name, -3) -- -(음수일때)는 끝에서부터 카운트
FROM employees;

--LENGTH : 문자열의 길이
SELECT first_name, LENGTH(first_name)
FROM employees;

--INSTR(문자열,찾을문자,m,n)
-- m은 검사위치, n은 찾을횟수
-- 디폴트 값은 m,n 각각 1
SELECT first_name,
INSTR(first_name, 'e', 2),
INSTR(first_name, 'e', 5),
INSTR(first_name, 'e', 1,2)
FROM employees
WHERE first_name = 'Nanette';

--LPAD / RPAD (문자열, 자릿수, 채울문자)
SELECT employee_id,first_name ,salary,
LPAD(salary,10,'#'),RPAD(salary,10,'*')
FROM employees;

--공백을 이용해 문자열을 분리
SELECT
'홍 길동' 성명,
SUBSTR('홍홍 길동',1,INSTR('홍홍 길동',' ')-1) 성,
SUBSTR('홍홍 길동',INSTR('홍홍 길동',' ')+1) 이름
FROM DUAL;

--문자형 함수 예제
SELECT last_name, CONCAT('직업명이 ',job_id) AS 직업명이
FROM employees
WHERE SUBSTR(job_id,4,3) = 'REP';
--job_id의 4번째문자부터 REP 인 경우

SELECT employee_id,
CONCAT(first_name, last_name) 전체이름,
last_name,
LENGTH(last_name) 길이,
INSTR(last_name, 'a') "'a'가 몇번째?"
FROM employees;

--REPLACE : 문자치환
SELECT job_id, REPLACE(job_id,'ACCOUNT','ACCNT')
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

--예제 1)
SELECT UPPER(last_name),LOWER(last_name),INITCAP(email)
FROM employees;

--예제 2)
SELECT job_id,SUBSTR(job_id,1,2)
FROM employees;


