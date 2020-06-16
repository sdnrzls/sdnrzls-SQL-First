-- �׷��Լ�

SELECT COUNT(*)
FROM employees;

SELECT salary
FROM employees
ORDER BY salary DESC;

-- MAX MIN
SELECT MAX(salary), MIN(salary)
FROM employees;
--���ڿ� ����(���ĺ� �� ���)
SELECT MAX(first_name), MIN(last_name)
FROM employees;
-- ��¥�� ����
SELECT MAX(hire_date), MIN(hire_date)
FROM employees;
-- SUM , AVG : �հ�� ��� (���ڸ� ����)
SELECT SUM(salary), AVG(salary)
FROM employees;
--COUNT
SELECT COUNT(*) --�������̺��� ��� ���� ����
FROM employees;

SELECT COUNT(NVL(commission_pct,0))--NULL���� �ƴ� ���ǰ���
FROM employees;

SELECT COUNT(department_id)
FROM employees;

SELECT COUNT(DISTINCT department_id) -- �μ��� ����
FROM employees;

--90�� �μ��� ������ ����
SELECT COUNT(employee_id)
FROM employees
WHERE department_id = 90;

SELECT AVG(commission_pct) -- �ΰ��� ������ ���
FROM employees;

SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�,
       TO_CHAR(ROUND(AVG(salary)),'$99,999') �޷�ǥ��
FROM employees
GROUP BY department_id;

SELECT department_id �μ���ȣ, ROUND(AVG(salary),1) ��ձ޿�,
SUM(salary) �ѱ޿��հ�, COUNT(*) �μ��ο���
FROM employees
GROUP BY department_id, job_id;

--���� 1)
SELECT department_id �μ���ȣ, COUNT(*)�����,
MAX(salary)�ְ�޿�,MIN(salary)�ּұ޿�,
SUM(salary) �ѱ޿��հ�,ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �ѱ޿��հ� DESC;

--���� 2)
SELECT department_id �μ���ȣ,job_id ����,manager_id ����ȣ,
sum(salary)�����հ�,count(*)������
FROM employees
GROUP BY department_id,job_id,manager_id
ORDER BY �μ���ȣ;

--���� 3)
SELECT ROUND(AVG(MAX(salary)))�μ����ְ�������, AVG(MIN(salary))�μ��������������
FROM employees
GROUP BY department_id;


--HAVING : �׷��Լ��� �̿��� ������ 
SELECT department_id �μ���, COUNT(*)�����
FROM employees
GROUP BY department_id
HAVING COUNT(*) >5;

--���� 1)
SELECT job_id ����,SUM(salary)���޿��հ�
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING AVG(salary)>10000 
ORDER BY ���޿��հ� DESC;

--���� 2)
SELECT department_id,ROUND(AVG(salary))
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary)<=7000;

-- ���� 3)
SELECT job_id,SUM(salary) �޿��Ѿ�
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>=13000 
ORDER BY �޿��Ѿ� DESC;


