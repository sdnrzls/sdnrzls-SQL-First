--������ �Լ��� ��ҹ��� �Լ��� ���� �����Լ��� ������.

--1.��ҹ��� ���� �Լ� (UPPER, LOWER, INITCAP)
SELECT 1+1
FROM DUAL; -- ������̺��� ������ ���̺�

--LOWER ���ڿ� �ҹ���,UPPER ���ڿ� �빮��, INITCAP ���ڿ� ù���ڸ� �빮�� ������ �ҹ��� ��ȯ
SELECT LOWER('SQL COURSE'), UPPER('SQL COURSE'), INITCAP('SQL COURES')
FROM DUAL;

--�����Լ��� where���� ���
SELECT employee_id , first_name
FROM employees
where UPPER(first_name)= 'PATRICK';


--2.���� ���� �Լ���

--CONCAT (���ڿ��� ��ħ)
SELECT first_name, last_name, CONCAT(first_name,last_name) Ǯ����
FROM employees;

--SUBSTR(���̸�,m,n) : m�� ���۹���, n�� �߶� ����
SELECT employee_id, first_name,
SUBSTR(first_name, 1, 3)
, SUBSTR(first_name, 2, 4)
, SUBSTR(first_name, 2) --���ۺ��� ������
, SUBSTR(first_name, -3) -- -(�����϶�)�� ���������� ī��Ʈ
FROM employees;

--LENGTH : ���ڿ��� ����
SELECT first_name, LENGTH(first_name)
FROM employees;

--INSTR(���ڿ�,ã������,m,n)
-- m�� �˻���ġ, n�� ã��Ƚ��
-- ����Ʈ ���� m,n ���� 1
SELECT first_name,
INSTR(first_name, 'e', 2),
INSTR(first_name, 'e', 5),
INSTR(first_name, 'e', 1,2)
FROM employees
WHERE first_name = 'Nanette';

--LPAD / RPAD (���ڿ�, �ڸ���, ä�﹮��)
SELECT employee_id,first_name ,salary,
LPAD(salary,10,'#'),RPAD(salary,10,'*')
FROM employees;

--������ �̿��� ���ڿ��� �и�
SELECT
'ȫ �浿' ����,
SUBSTR('ȫȫ �浿',1,INSTR('ȫȫ �浿',' ')-1) ��,
SUBSTR('ȫȫ �浿',INSTR('ȫȫ �浿',' ')+1) �̸�
FROM DUAL;

--������ �Լ� ����
SELECT last_name, CONCAT('�������� ',job_id) AS ��������
FROM employees
WHERE SUBSTR(job_id,4,3) = 'REP';
--job_id�� 4��°���ں��� REP �� ���

SELECT employee_id,
CONCAT(first_name, last_name) ��ü�̸�,
last_name,
LENGTH(last_name) ����,
INSTR(last_name, 'a') "'a'�� ���°?"
FROM employees;

--REPLACE : ����ġȯ
SELECT job_id, REPLACE(job_id,'ACCOUNT','ACCNT')
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

--���� 1)
SELECT UPPER(last_name),LOWER(last_name),INITCAP(email)
FROM employees;

--���� 2)
SELECT job_id,SUBSTR(job_id,1,2)
FROM employees;


