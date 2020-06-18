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

--LEFT JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
LEFT OUTER JOIN departments d
    on e.department_id = d.department_id;
    
--RIGHT JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
RIGHT OUTER JOIN departments d
    on e.department_id = d.department_id;

--Full OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
FULL OUTER JOIN departments d
    on e.department_id = d.department_id;

-- ���� 1)
SELECT c.country_name ����, c.country_id ������ȣ, l.location_id ������ȣ,l.city ���� 
FROM countries c
LEFT JOIN locations l
 on c.country_id = l.country_id
ORDER BY ������ȣ DESC;

-- Cross JOIN(��������)
SELECT c.country_name,r.region_name
FROM countries c
CROSS JOIN regions r;

--���� �� ����

-- ���� 1)
SELECT d.department_name �μ���,d.manager_id �Ŵ�����ȣ,
e.last_name||' '||e.first_name �Ŵ����̸�,e.phone_number ��ȭ��ȣ
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id
ORDER BY 2;

-- ���� 2)
SELECT e.employee_id ������ȣ,e.hire_date �������,
j.job_id ����,j.job_title ��å
FROM employees e
JOIN jobs j
    on e.job_id = j.job_id;

--���� 3)
SELECT TO_CHAR(e.hire_date,'YYYY') �Ի�⵵, 
ROUND(AVG(e.salary)) ��ձ޿�
FROM employees e
JOIN jobs j on e.job_id = j.job_id
WHERE j.job_title = 'Sales Manager' 
group by TO_CHAR(e.hire_date,'YYYY')
ORDER BY 1;

--���� 4)
SELECT l.city, ROUND(AVG(e.salary)) ��ձ޿� ,COUNT(*)
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id 
group by l.city
HAVING NOT COUNT(*)>10
ORDER BY ��ձ޿�;

--���� 5)
SELECT e.employee_id ������ȣ, e.last_name �����̸� ,e.salary ��������
,m.last_name �Ŵ���, m.salary �Ŵ�������
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
