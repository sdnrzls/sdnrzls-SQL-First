-- �ܼ��� View ����� EMP_V1
-- �ϳ��� �������̺� ���, �Լ��� �׷� ��� ����, DML ��밡��

DROP VIEW EMP_V1; -- �̸� �� ���� ���

-- employees ���̺��� �ʿ��� ������ ��� ��� ����
CREATE VIEW EMP_V1
AS
SELECT employee_id, first_name,last_name, email, hire_date, job_id
FROM employees;

-- ���̺�ó�� select �� ���
select * from EMP_V1;

DESC EMP_V1;

-- ���̺�ó�� DML ��밡��(��� ������ ���̺� => ���� ���̺� �Էµ�)
INSERT INTO EMP_V1 (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (333, 'David','King','Dking',SYSDATE,'IT_PROG');
-- �信 �Էµ� ������ Ȯ��
SELECT * FROM EMP_V1;
SELECT * FROM employees;
DESC employees;
-- �����ϱ�
DELETE FROM emp_v1
where employee_id = 333;
commit;
-- �ι�° �� �����
CREATE VIEW EMP_V2
AS
SELECT employee_id ������ȣ, last_name �̸�, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v2;

-- ����° �� �����
CREATE VIEW EMP_V3(������ȣ, �̸�, �̸���, �������, ���� )
AS
SELECT employee_id, last_name , email, hire_date, job_id
FROM employees;

select * FROM emp_v1;
select * FROM emp_v2;
select * FROM emp_v3;
select * from employees;

--DML ��� 3��° �信��
INSERT INTO emp_v3 (������ȣ, �̸�, �̸���, �������, ���� )
VALUES ( 334, 'LaLa', 'LALA', SYSDATE, 'IT_PROG');


-- ������ �� �����
-- �׷��Լ��� ����� ��� DML ��� �Ұ�
-- or REPLACE�� ����Ͽ� ������ ������
CREATE or REPLACE VIEW �μ���_����_����
AS 
SELECT department_id �μ���ȣ, COUNT(employee_id) ������ ,
    MAX(salary) �ְ�޿�, MIN(salary) �����޿�,
    ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY 2;

SELECT * FROM �μ���_����_����;

-- �б� ���� �� ( �ɼ� with READ ONLY )
CREATE or replace VIEW EMP_V_read
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees
WHERE department_id = 90
WITH READ ONLY; -- �б� ����

SELECT * FROM emp_v_read;

-- DML ��� �Ұ�
DELETE FROM EMP_V_READ; -- ��� �� ����

-- üũ �ɼ� ��
CREATE or replace VIEW emp_v_check
AS
SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
WHERE department_id = 90
WITH check option; -- where���� ���ǿ����� ������ �Է� ����

SELECT * FROM emp_v_check;

-- 90�� �μ� �϶��� DML ����
INSERT INTO emp_v_check (employee_id, last_name, email, hire_date, 
                            job_id, department_id)
VALUES ( 444, '�˸�','ALI',SYSDATE,'IT_PROG', 90);















