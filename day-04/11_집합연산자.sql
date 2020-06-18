-- ���տ�����(UNION)

--UNION : ������ �ߺ�����
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id,job_id
FROM job_history;

--UNION ALL: ������ �ߺ�����
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id,job_id
FROM job_history;

--INTERSECT : ������
SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history;

--MINUS : ������
SELECT employee_id,job_id
FROM employees
MINUS
SELECT employee_id,job_id
FROM job_history;

-- ����1)
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;

-- ����2)
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

-- ����3)
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

-- ����4)
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;