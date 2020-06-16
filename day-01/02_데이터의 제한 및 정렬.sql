-- 1. ���̺��� ��� ������ ��������
SELECT * FROM employees;
-- 2. where ���� ������ ���� �����Ѵ�.
-- ��ġ�� FROM �� ������ ��ġ
SELECT *
FROM employees
where department_id=90; -- 90�� �μ���

SELECT *
FROM employees
where salary = 24000; -- ������ 24000�� ����
/*
where ���� ����Ҷ� ������
����(String)�� ��¥(Date) ���� �׻� ����ǥ(')�� ǥ��
���ڰ��� ��ҹ��ڸ� �����Ѵ�.(case=Sensitive)
��¥���� ��¥ ���˿� ����� �ʵ��� (Format-sensitive)
����Ŭ�� ��¥������ RP/MM/DD(RR�� 2�ڸ� �⵵)
*/
--3 where + ���ڿ�
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE first_name = 'Steven';
--4 where + ��¥
SELECT SYSDATE FROM dual;
--dual�� �������̺� SysDATE�� ���� ��¥ �ð�
SELECT *
FROM employees
where hire_date >= '03/06/17'; --�⵵/��/��¥

--�� ������
SELECT *
FROM employees
where salary >= 10000; -- ���ں�

SELECT *
FROM employees
where hire_date >= '03/06/17'; --��¥��

SELECT*
FROM employees
WHERE first_name > 'King'; --���ں�(���ĺ���)

--����1
SELECT *
FROM employees
where employee_id = 100;
--����2
SELECT *
FROM employees
where first_name = 'David';
--����3
SELECT *
FROM employees
WHERE employee_id <= 105;
--����4
SELECT *
FROM job_history
where start_date > '06/03/03';
--����5
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

--����1
SELECT*
FROM employees
WHERE salary > 4000 and job_id = 'IT_PROG';

--����2
SELECT*
FROM employees
WHERE salary > 4000 and (job_id = 'IT_PROG' or job_id ='FI_ACCOUNT');

-- IN ������
SELECT*
FROM employees
where salary = 4000 OR salary = 3000 OR salary = 2700;

SELECT*
FROM employees
where salary IN (4000,3000,2700);

--����1
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
Like �����ڴ� _�� %�� ���
%�� ���ڰ� 0���Ǵ� 1���̻�
_�� ���ڰ� 1��
*/

SELECT *
FROM employees
WHERE last_name LIKE 'B%'; --B�� �����ϴ�

SELECT *
FROM employees
WHERE last_name LIKE '%b%'; -- b�� �յھ��� ���ԵǾ��ִ�

SELECT*
FROM employees
where first_name Like '__s%'; -- ����° ���ڰ� s�϶� 

SELECT*
FROM employees
WHERE last_name LIKE '%y'; -- Y�� ������

SELECT*
FROM employees
WHERE last_name LIKE '___y'; -- 4��° Y��

--���� 1)
SELECT*
FROM employees
WHERE job_id LIKE '%AD%'; 
--���� 2)
SELECT*
FROM employees
WHERE job_id LIKE '%AD___'; -- ������� 3��

--���� 3)
SELECT*
FROM employees
WHERE PHONE_NUMBER LIKE '%1234';
--���� 4)
SELECT*
FROM employees
WHERE phone_number NOT LIKE '%3' AND phone_number LIKE '%9';
--���� 5)
SELECT*
FROM employees
WHERE job_id Like '%MGR%' OR job_id Like '%ASST%'; 

-- is NULL / is NOT NULL
SELECT*
FROM employees
WHERE commission_pct IS NULL; -- NULL�ΰ�츸 ǥ��  == NULL(X)

SELECT*
FROM employees
WHERE commission_pct IS NOT NULL; 
--���� 1)
SELECT*
FROM employees
WHERE manager_id IS NULL;

-- ORDER BY �࿡ ���� ���ļ����� �����Ҽ� �ִ�
SELECT*
FROM employees
ORDER BY salary; -- ASC �⺻�� ��������

SELECT*
FROM employees
ORDER BY salary DESC; -- DESC �������� (ū���� ��������)

SELECT*
FROM employees
ORDER BY last_name; --���ڴ� ���ĺ� ������ ����

--��Ƽ����
SELECT employee_id, last_name, department_id
FROM employees
ORDER BY department_id, employee_id; --�μ���ȣ�� ������ �����ȣ�� ����

--���� �����Ͽ� ����
SELECT employee_id, last_name, salary*12 ����
FROM employees
ORDER BY ���� DESC; --������ ū ������ ����

--ORDER BY�� WHERE �� ������ ��ġ
SELECT employee_id, last_name, salary*12 ����
FROM employees
WHERE department_id = 90
ORDER BY ���� DESC; --������ ū ������ ����

--���� 1)
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY  employee_id DESC;

--���� 2)
SELECT*
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

--���� 3) 
SELECT employee_id,first_name,department_id,salary
FROM employees
WHERE employee_id BETWEEN 120 and 150
ORDER BY department_id DESC,salary DESC;



