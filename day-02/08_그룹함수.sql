-- 그룹함수

SELECT COUNT(*)
FROM employees;

SELECT salary
FROM employees
ORDER BY salary DESC;

-- MAX MIN
SELECT MAX(salary), MIN(salary)
FROM employees;
--문자열 적용(알파벳 순 출력)
SELECT MAX(first_name), MIN(last_name)
FROM employees;
-- 날짜에 적용
SELECT MAX(hire_date), MIN(hire_date)
FROM employees;
-- SUM , AVG : 합계와 평균 (숫자만 가능)
SELECT SUM(salary), AVG(salary)
FROM employees;
--COUNT
SELECT COUNT(*) --직원테이블의 모든 행의 개수
FROM employees;

SELECT COUNT(NVL(commission_pct,0))--NULL값이 아닌 행의개수
FROM employees;

SELECT COUNT(department_id)
FROM employees;

SELECT COUNT(DISTINCT department_id) -- 부서의 개수
FROM employees;

--90번 부서의 직원의 숫자
SELECT COUNT(employee_id)
FROM employees
WHERE department_id = 90;

SELECT AVG(commission_pct) -- 널값은 제외한 평균
FROM employees;

SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여,
       TO_CHAR(ROUND(AVG(salary)),'$99,999') 달러표시
FROM employees
GROUP BY department_id;

SELECT department_id 부서번호, ROUND(AVG(salary),1) 평균급여,
SUM(salary) 총급여합계, COUNT(*) 부서인원수
FROM employees
GROUP BY department_id, job_id;

--예제 1)
SELECT department_id 부서번호, COUNT(*)사원수,
MAX(salary)최고급여,MIN(salary)최소급여,
SUM(salary) 총급여합계,ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 총급여합계 DESC;

--예제 2)
SELECT department_id 부서번호,job_id 직업,manager_id 상사번호,
sum(salary)월급합계,count(*)직원수
FROM employees
GROUP BY department_id,job_id,manager_id
ORDER BY 부서번호;

--예제 3)
SELECT ROUND(AVG(MAX(salary)))부서별최고월급평균, AVG(MIN(salary))부서별최저월급평균
FROM employees
GROUP BY department_id;


--HAVING : 그룹함수를 이용한 조건절 
SELECT department_id 부서명, COUNT(*)사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) >5;

--예제 1)
SELECT job_id 직종,SUM(salary)월급여합계
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING AVG(salary)>10000 
ORDER BY 월급여합계 DESC;

--예제 2)
SELECT department_id,ROUND(AVG(salary))
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary)<=7000;

-- 예제 3)
SELECT job_id,SUM(salary) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>=13000 
ORDER BY 급여총액 DESC;


