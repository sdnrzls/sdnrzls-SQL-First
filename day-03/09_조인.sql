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



