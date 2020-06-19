-- DML �۾�

-- INSERT: �� ���� �Է��ϱ�
--1. ������ ���� ���������� Ȯ�� (DESC + ���̺�)
DESC departments;

-- ��ü ���� �� �Է��ϴ� ��� 1
INSERT INTO departments (department_id,department_name,
manager_id,location_id)
VALUES (71,'���ߺ� 1',100,1700);

SELECT*
FROM departments;
commit;

--���� �̸��� ���� ��� ��ü ���� �� �Է��ؾ���
INSERT INTO departments
VALUES (72,'���ߺ� 2',100,1700);
COMMIT;

-- ���� ������ �ٲܰ��
INSERT INTO departments (department_name,
manager_id,location_id,department_id)
VALUES ('���ߺ� 3',100,1700,73);
COMMIT;

-- �ڵ����� �ΰ� �Է�
INSERT INTO departments (department_id,department_name)
VALUES (74,'���ߺ� 4');
COMMIT;
DESC departments;

-- sysdate ���糯¥ �Է�
INSERT INTO employees(employee_id,first_name,
last_name,email,hire_date,job_id)
VALUES (1,'ȫ','�浿','hong@naver.com',sysdate,'IT_PROG');
COMMIT;
DESC employees;

--��¥ �Է��ϱ�
INSERT INTO employees(employee_id,first_name,
last_name,email,hire_date,job_id)
VALUES (2,'��','�浿','kang@naver.com',TO_DATE('2020-04-05','YYYY-MM-DD'),'IT_PROG');
COMMIT;

-- ����ڷ� ���� �Է¹ޱ�
INSERT INTO departments (department_id,department_name)
VALUES (&id,'&name'); --75, ���ߺ� 5
COMMIT;

-- ���̺� �����
CREATE TABLE XX_EMP (
    EMPNO number,
    ENAME VARCHAR2(100),
    SAL   number );
COMMIT;
-- ���̺� ��ü�� ī���ؼ� �Է��ϴ� ���   
INSERT INTO XX_EMP(EMPNO,ENAME,SAL)
SELECT employee_id,first_name,salary
FROM employees;
COMMIT;

--INSERT�� �����߿� ������ ���°��
--1.�⺻Ű�� �̹� �ִ� (�ߺ���) ���� �Է��� ���
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(10,'���ߺ� 10',100,1700);
--2. FK(�ܷ�Ű)�� �������� ���� ���� �Է�
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(5,'���ߺ� 5',100,1);
--3.�������� ������ Ʋ����
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(5,1234,100,1);
--4.�������� ����� ���� ������
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES(5,'���ߺ� 5 ���ߺ� 5 ���ߺ� 5 ���ߺ� 5 ���ߺ� 5 ���ߺ� 5',100,'d1');
DESC departments;

--���̺��� ī���ϱ�
CREATE TABLE COPY_DEPT
AS
SELECT * FROM departments;


-- ���� 1)departments ���̺� ������ ���� ������ department_id,department_name,
-- manager_id�� 200, location_id �� 1700�� ���� 3�� �Է��Ͻÿ�
INSERT INTO departments(department_id,department_name,
manager_id,location_id)
VALUES (273,'sample dept 3',200,1700);
COMMIT;

--���� 2) ���̺��� ���� �� SELECT ���� �̿��Ͽ� departments ���̺� ������ ���� �Է�
CREATE TABLE copy_departments(department_id number(4,0),
department_name VARCHAR2(30 byte),manager_id NUMBER(6,0),location_id number(4,0));
COMMIT;

INSERT INTO copy_departments
SELECT *
From departments;
COMMIT;



