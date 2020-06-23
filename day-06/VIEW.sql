--단순한 뷰 만들기 EMP_V1
--하나의 테이블, 함수나 그룹 사용 안함,DML 사용가능
Drop view EMP_v1; -- 뷰 삭제

--employees 테이블에서 필요한 열들을 골라서 뷰로 생성하기
CREATE view EMP_v1
as
SELECT employee_id,first_name,last_name,email,hire_date,job_id
FROM employees;

--뷰를 만들고 나서 select사용
SELECT*FROM EMP_v1;

SELECT*FROM USER_VIEWS
WHERE view_name = 'EMP_v1';

DESC EMP_v1;

--테이블 처럼 DML 사용가능
INSERT INTO EMP_v1 (employee_id,first_name,last_name,email,hire_date,job_id)
VALUES             (333,'David','KIng','Dking',sysdate,'IT_PROG');

--뷰에 새로 입력된 데이처 확인
SELECT*FROM EMP_v1
WHERE employee_id =333;

--원본 테이블에서도 확인
SELECT*FROM employees
WHERE employee_id=333;


--------------------------------------------------------------------------------
--단순 뷰 EMP_V2 만들기
--원본테이블의 열의 이름에 별칭을 붙임
DROP VIEW EMP_V2;

CREATE VIEW EMP_V2
AS
SELECT employee_id 직원번호 ,first_name 이름, last_name 성,email,hire_date,job_id
FROM employees;

SELECT*FROM EMP_V2;

--DML 사용 , 새직원 입력
INSERT INTO EMP_V2 (직원번호,이름,성,email,hire_date,job_id)
VALUES             (334,'Lara','Craft','Lara',sysdate,'IT_PROG');
--새 직원 삭제
DELETE FROM EMP_V2
WHERE 직원번호 = 334;

SELECT*FROM EMP_V2
WHERE EMP_ID= 334;

SELECT*FROM employees
WHERE employee_id = 334;

-------------------------------------------------------------------------------
--EMP_V3 뷰 테이블 생성
--열의 이름 바꾸기

DROP VIEW EMP_V3;

CREATE VIEW EMP_v3 (직원번호,이름,성,이메일,고용일자,직종)
as
SELECT employee_id,first_name,last_name,email,hire_date,job_id
FROM employees;

SELECT*FROM EMP_V3;
---------------------------------------------------------------------------------
--복잡한 뷰 만들기
-- 복잡한 뷰로써 그룹함수를 사용한 뷰는 DML 사용 불가

DROP VIEW 부서별_직원_보고서;

CREATE VIEW 부서별_직원_보고서
as
SELECT department_id 부서번호,COUNT(employee_id)직원수,
MAX(salary) 최고급여,
MIN(salary) 최저급여
FROM employees
GROUP by department_id;

SELECT*FROM 부서별_직원_보고서;

--만약 부서별 직원 보고서에 평균 급여도 보여줄수 있도록 수정
--다음과 같이 사용(or replace)!!
CREATE or REPLACE VIEW 부서별_직원_보고서
as
SELECT department_id 부서번호,COUNT(employee_id)직원수,
MAX(salary) 최고급여,
MIN(salary) 최저급여,
AVG(salary) 평균급여
FROM employees
GROUP by department_id;

SELECT*FROM 부서별_직원_보고서;

--두개 이상의 테이블 뷰
CREATE or REPLACE VIEW 직원_부서_뷰
as 
SELECT employee_id, first_name||' '||last_name 풀네임,
salary,nvl(de
