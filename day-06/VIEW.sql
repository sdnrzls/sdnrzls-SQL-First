--�ܼ��� �� ����� EMP_V1
--�ϳ��� ���̺�, �Լ��� �׷� ��� ����,DML ��밡��
Drop view EMP_v1; -- �� ����

--employees ���̺��� �ʿ��� ������ ��� ��� �����ϱ�
CREATE view EMP_v1
as
SELECT employee_id,first_name,last_name,email,hire_date,job_id
FROM employees;

--�並 ����� ���� select���
SELECT*FROM EMP_v1;

SELECT*FROM USER_VIEWS
WHERE view_name = 'EMP_v1';

DESC EMP_v1;

--���̺� ó�� DML ��밡��
INSERT INTO EMP_v1 (employee_id,first_name,last_name,email,hire_date,job_id)
VALUES             (333,'David','KIng','Dking',sysdate,'IT_PROG');

--�信 ���� �Էµ� ����ó Ȯ��
SELECT*FROM EMP_v1
WHERE employee_id =333;

--���� ���̺����� Ȯ��
SELECT*FROM employees
WHERE employee_id=333;


--------------------------------------------------------------------------------
--�ܼ� �� EMP_V2 �����
--�������̺��� ���� �̸��� ��Ī�� ����
DROP VIEW EMP_V2;

CREATE VIEW EMP_V2
AS
SELECT employee_id ������ȣ ,first_name �̸�, last_name ��,email,hire_date,job_id
FROM employees;

SELECT*FROM EMP_V2;

--DML ��� , ������ �Է�
INSERT INTO EMP_V2 (������ȣ,�̸�,��,email,hire_date,job_id)
VALUES             (334,'Lara','Craft','Lara',sysdate,'IT_PROG');
--�� ���� ����
DELETE FROM EMP_V2
WHERE ������ȣ = 334;

SELECT*FROM EMP_V2
WHERE EMP_ID= 334;

SELECT*FROM employees
WHERE employee_id = 334;

-------------------------------------------------------------------------------
--EMP_V3 �� ���̺� ����
--���� �̸� �ٲٱ�

DROP VIEW EMP_V3;

CREATE VIEW EMP_v3 (������ȣ,�̸�,��,�̸���,�������,����)
as
SELECT employee_id,first_name,last_name,email,hire_date,job_id
FROM employees;

SELECT*FROM EMP_V3;
---------------------------------------------------------------------------------
--������ �� �����
-- ������ ��ν� �׷��Լ��� ����� ��� DML ��� �Ұ�

DROP VIEW �μ���_����_����;

CREATE VIEW �μ���_����_����
as
SELECT department_id �μ���ȣ,COUNT(employee_id)������,
MAX(salary) �ְ�޿�,
MIN(salary) �����޿�
FROM employees
GROUP by department_id;

SELECT*FROM �μ���_����_����;

--���� �μ��� ���� ������ ��� �޿��� �����ټ� �ֵ��� ����
--������ ���� ���(or replace)!!
CREATE or REPLACE VIEW �μ���_����_����
as
SELECT department_id �μ���ȣ,COUNT(employee_id)������,
MAX(salary) �ְ�޿�,
MIN(salary) �����޿�,
AVG(salary) ��ձ޿�
FROM employees
GROUP by department_id;

SELECT*FROM �μ���_����_����;

--�ΰ� �̻��� ���̺� ��
CREATE or REPLACE VIEW ����_�μ�_��
as 
SELECT employee_id, first_name||' '||last_name Ǯ����,
salary,nvl(de
