--JOIN 
SELECT e.employee_id, e.last_name, e.department_id,
       d.department_name
FROM employees e 
JOIN departments d
    ON e.department_id = d.department_id;

--NATURAL JOIN : ON �� ����
SELECT employee_id, first_name,job_id,job_title
FROM employees
NATURAL JOIN jobs;

--�⺻ ��������
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

--WHERE �� �߰�
SELECT e.employee_id, e.last_name, e.department_id,
       d.department_name
FROM employees e 
JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id =50 AND e.salary >5000;

--3�� ���̺� ����
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--���� 1)
SELECT d.department_name �μ���, l.city ���ø�, c.country_name ������
FROM departments d
JOIN locations l on d.location_id = l.location_id
JOIN countries c on l.country_id = c.country_id
WHERE (l.city = 'Seattle' OR l.city = 'London') AND c.country_name LIKE 'United%'
ORDER BY 2;


-- Self JOIN(��ü����)
SELECT e.last_name ����, e.employee_id ������ȣ
,m.last_name �Ŵ���, m.employee_id ������ȣ2
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;



