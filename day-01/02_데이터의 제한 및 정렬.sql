-- 1. 테이블의 모든 데이터 가져오기
SELECT * FROM employees;
-- 2. where 절에 가져올 행을 선택한다.
-- 위치는 FROM 절 다음에 위치
SELECT *
FROM employees
where department_id=90; -- 90번 부서만

SELECT *
FROM employees
where salary = 24000; -- 월급이 24000인 직원
/*
where 절을 사용할때 주의점
문자(String)과 날짜(Date) 값은 항상 따옴표(')로 표시
문자값은 대소문자를 구분한다.(case=Sensitive)
날짜값은 날짜 포맷에 벗어나지 않도록 (Format-sensitive)
오라클의 날짜포맷은 RP/MM/DD(RR은 2자리 년도)
*/
--3 where + 문자열
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE first_name = 'Steven';
--4 where + 날짜
SELECT SYSDATE FROM dual;
--dual은 샘플테이블 SysDATE는 현재 날짜 시간
SELECT *
FROM employees
where hire_date >= '03/06/17'; --년도/월/날짜

--비교 연산자
SELECT *
FROM employees
where salary >= 10000; -- 숫자비교

SELECT *
FROM employees
where hire_date >= '03/06/17'; --날짜비교

SELECT*
FROM employees
WHERE first_name > 'King'; --문자비교(알파벳순)

--예제1
SELECT *
FROM employees
where employee_id = 100;
--예제2
SELECT *
FROM employees
where first_name = 'David';
--예제3
SELECT *
FROM employees
WHERE employee_id <= 105;
--예제4
SELECT *
FROM job_history
where start_date > '06/03/03';
--예제5
SELECT*
FROM departments
--where location_id <>1700; -- != 1700
where location_id != 1700;

--6. AND OR
SELECT*
FROM employees
where department_id = 60 OR (department_id =80 AND salary>10000);

SELECT*
FROM employees
where (department_id = 60 OR department_id =80) AND salary>10000;

SELECT*
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000 And job_id = 'AD_VP';

SELECT*
FROM employees
where not(hire_date > '04/01/01' OR salary > 5000);
-- (hire_date <= '04/01/01' and salary <= 5000);

--예제1
SELECT*
FROM employees
WHERE salary > 4000 and job_id = 'IT_PROG';

--예제2
SELECT*
FROM employees
WHERE salary > 4000 and (job_id = 'IT_PROG' or job_id ='FI_ACCOUNT');

-- IN 연산자
SELECT*
FROM employees
where salary = 4000 OR salary = 3000 OR salary = 2700;

SELECT*
FROM employees
where salary IN (4000,3000,2700);

--예제1
SELECT*
FROM employees
WHERE salary IN (10000, 17000, 24000);

SELECT*
FROM employees
where department_id NOT IN(30, 50, 80, 100, 110); 

--Between
SELECT*
FROM employees
where salary BETWEEN 9000 and 10000;

SELECT*
FROM employees
WHERE salary BETWEEN 10000 and 20000;

SELECT*
FROM employees
WHERE hire_date BETWEEN '04/01/01' and '04/12/30';

SELECT*
FROM employees
WHERE salary not BETWEEN 7000 and 17000;

/*
Like 연산자는 _와 %를 사용
%는 문자가 0개또는 1개이상
_는 문자가 1개
*/

SELECT *
FROM employees
WHERE last_name LIKE 'B%'; --B로 시작하는

SELECT *
FROM employees
WHERE last_name LIKE '%b%'; -- b가 앞뒤어디든 포함되어있는

SELECT*
FROM employees
where first_name Like '__s%'; -- 세번째 문자가 s일때 

SELECT*
FROM employees
WHERE last_name LIKE '%y'; -- Y로 끝나는

SELECT*
FROM employees
WHERE last_name LIKE '___y'; -- 4번째 Y로

--예제 1)
SELECT*
FROM employees
WHERE job_id LIKE '%AD%'; 
--예제 2)
SELECT*
FROM employees
WHERE job_id LIKE '%AD___'; -- 언더라인 3개

--예제 3)
SELECT*
FROM employees
WHERE PHONE_NUMBER LIKE '%1234';
--예제 4)
SELECT*
FROM employees
WHERE phone_number NOT LIKE '%3' AND phone_number LIKE '%9';
--예제 5)
SELECT*
FROM employees
WHERE job_id Like '%MGR%' OR job_id Like '%ASST%'; 

-- is NULL / is NOT NULL
SELECT*
FROM employees
WHERE commission_pct IS NULL; -- NULL인경우만 표시  == NULL(X)

SELECT*
FROM employees
WHERE commission_pct IS NOT NULL; 
--예제 1)
SELECT*
FROM employees
WHERE manager_id IS NULL;

-- ORDER BY 행에 대해 정렬순서를 지정할수 있다
SELECT*
FROM employees
ORDER BY salary; -- ASC 기본이 오름차순

SELECT*
FROM employees
ORDER BY salary DESC; -- DESC 내림차순 (큰것이 제일위에)

SELECT*
FROM employees
ORDER BY last_name; --문자는 알파벳 순으로 정렬

--멀티정렬
SELECT employee_id, last_name, department_id
FROM employees
ORDER BY department_id, employee_id; --부서번호로 정렬후 사원번호로 정렬

--열을 생성하여 정렬
SELECT employee_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC; --연봉이 큰 순으로 정렬

--ORDER BY는 WHERE 절 다음에 위치
SELECT employee_id, last_name, salary*12 연봉
FROM employees
WHERE department_id = 90
ORDER BY 연봉 DESC; --연봉이 큰 순으로 정렬

--예제 1)
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY  employee_id DESC;

--예제 2)
SELECT*
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

--예제 3) 
SELECT employee_id,first_name,department_id,salary
FROM employees
WHERE employee_id BETWEEN 120 and 150
ORDER BY department_id DESC,salary DESC;



