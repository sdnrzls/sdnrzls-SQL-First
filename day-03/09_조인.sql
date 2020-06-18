--JOIN 
SELECT e.employee_id, e.last_name, e.department_id,
       d.department_name
FROM employees e 
JOIN departments d
    ON e.department_id = d.department_id;

--NATURAL JOIN : ON 절 생략
SELECT employee_id, first_name,job_id,job_title
FROM employees
NATURAL JOIN jobs;

--기본 동등조인
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

--WHERE 절 추가
SELECT e.employee_id, e.last_name, e.department_id,
       d.department_name
FROM employees e 
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id =50 AND e.salary >5000;

--3개 테이블 조인
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--예제 1)
SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments d
JOIN locations l on d.location_id = l.location_id
JOIN countries c on l.country_id = c.country_id
WHERE (l.city = 'Seattle' OR l.city = 'London') AND c.country_name LIKE 'United%'
ORDER BY 2;


-- Self JOIN(자체조인)
SELECT e.last_name 직원, e.employee_id 직원번호
,m.last_name 매니저, m.employee_id 직원번호2
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;

--LEFT JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d
    on e.department_id = d.department_id;
    
--RIGHT JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d
    on e.department_id = d.department_id;

--Full OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments d
    on e.department_id = d.department_id;

-- 예제 1)
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호,l.city 도시 
FROM countries c
LEFT JOIN locations l
 on c.country_id = l.country_id
ORDER BY 지역번호 DESC;

-- Cross JOIN(교차조인)
SELECT c.country_name,r.region_name
FROM countries c
CROSS JOIN regions r;

--리뷰 및 예제

-- 예제 1)
SELECT d.department_name 부서명,d.manager_id 매니저번호,
e.last_name||' '||e.first_name 매니저이름,e.phone_number 전화번호
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id
ORDER BY 2;

-- 예제 2)
SELECT e.employee_id 직원번호,e.hire_date 고용일자,
j.job_id 직종,j.job_title 직책
FROM employees e
JOIN jobs j
    on e.job_id = j.job_id;

--예제 3)
SELECT TO_CHAR(e.hire_date,'YYYY') 입사년도, 
ROUND(AVG(e.salary)) 평균급여
FROM employees e
JOIN jobs j on e.job_id = j.job_id
WHERE j.job_title = 'Sales Manager' 
group by TO_CHAR(e.hire_date,'YYYY')
ORDER BY 1;

--예제 4)
SELECT l.city, ROUND(AVG(e.salary)) 평균급여 ,COUNT(*)
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id 
group by l.city
HAVING NOT COUNT(*)>10
ORDER BY 평균급여;

--예제 5)
SELECT e.employee_id 직원번호, e.last_name 직원이름 ,e.salary 직원월급
,m.last_name 매니저, m.salary 매니저월급
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
