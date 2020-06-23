--���������� �߰� �� ����
DROP TABLE class;
CREATE TABLE class (
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);
INSERT INTO class VALUES ('01', '�����ͺ��̽�');
INSERT INTO class VALUES ('02', '�ڹ�');
SELECT * FROM class;

CREATE TABLE student (
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);
INSERT INTO student VALUES ('0414', 'ȫ�浿', '01');
INSERT INTO student VALUES ('0415', '�Ӳ���', '02');
INSERT INTO student VALUES ('0416', '�̼���', '03');
commit;
SELECT * FROM student;

-- Ŭ���� ���̺� �⺻Ű �߰�
ALTER TABLE class
ADD CONSTRAINT class_cno_pk PRIMARY KEY (cno);
-- Ŭ���� ���̺� ����ũŰ �߰�
ALTER TABLE class
ADD CONSTRAINT class_cname_uk UNIQUE (cname);

-- �������� ��ȸ ��ɹ�
SELECT *
FROM ALL_CONSTRAINTS -- ��� ��������
WHERE table_name = 'CLASS'; -- ���̺�� �Է�(�빮��)

-- �л� ���̺� �⺻Ű �߰�
ALTER TABLE student
ADD CONSTRAINT student_sno_pk PRIMARY KEY (sno);
-- �л� ���̺� sname �� NOT NULL �߰�
ALTER TABLE student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
-- �л� ���̺� �ܷ�Ű �߰�
ALTER TABLE student
ADD CONSTRAINT student_cno_fk FOREIGN KEY (cno) REFERENCES class (cno);
SELECT * FROM student;

SELECT * FROM class;
UPDATE student SET cno = '01'
WHERE sno= '0416';

-- student �� class ���̺� ����
-- ���������� �ִ� ���̺� ���� CASCADE CONSTRAINT
ALTER TABLE class
DROP CONSTRAINT class_cno_pk;

ALTER TABLE class
DROP CONSTRAINT class_cno_pk CASCADE;

ALTER TABLE class
DROP UNIQUE (canme);

ALTER TABLE student
DROP PRIMARY KEY;


--------------------------------------------------------------
-- ���̺� �÷� �߰�
-- ���������� ����� �� ���̺� �����

--1. 90�� �μ��� �������� �����̺� E_EMP�� �Է��ϱ�
CREATE TABLE E_EMP
AS 
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM E_EMP;
DESC E_EMP;

--2. ���� �̸��� �����Ͽ� E_EMP2 ����
CREATE TABLE E_EMP2 ( emp_id, fname, lname, sal, dept_id )
AS
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE department_id = 90;

SELECT * FROM e_emp2;

-- ���߰� 
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
ADD ( GENDER VARCHAR2(1));

-- ����Ʈ �� 0
ALTER TABLE E_EMP
ADD ( Ŀ�̼�  NUMBER default 0 NOT NULL);

ALTER TABLE E_EMP
ADD ( Ŀ�̼�2  NUMBER default 0 );
-- �ѹ��� �ΰ��� �� �߰�
ALTER TABLE E_EMP
ADD ( ��¥  DATE default sysdate,  ������ VARCHAR2(100) default USER);

SELECT * FROM E_EMP;

----------------------------------------------------------------
-- ���� ����
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
MODIFY ( ������ VARCHAR2(200)); -- ����(100) => (200)������
DESC E_EMP;

ALTER TABLE E_EMP
MODIFY ( ������ VARCHAR2(50)); -- ����(200) => (50)������

ALTER TABLE E_EMP
MODIFY ( ������ VARCHAR2(1)); -- ����(50) => (1)������

SELECT * FROM E_EMP;

ALTER TABLE E_EMP
MODIFY ( GENDER NUMBER); 

DESC E_EMP;

UPDATE E_EMP
SET ������ = NULL;

-----------------------------------------------------
--���� ����
SELECT * FROM E_EMP;

ALTER TABLE E_EMP
DROP COLUMN ������;  -- ������ �÷� ����

-- ������ �� ����
ALTER TABLE E_EMP
DROP ( GENDER , Ŀ�̼�, Ŀ�̼�2, ��¥ );

---------------------------------------------------
-- ���̺� �̸� ����
RENAME E_EMP TO �������̺�;

-- ���̺��� �� �� �̸� ����
SELECT * FROM �������̺�;

-- ���� �̸��� ����
ALTER TABLE �������̺�
RENAME column department_id TO �μ���ȣ;

ALTER TABLE �������̺�
RENAME column salary TO �޿�;

ALTER TABLE �������̺�
RENAME column employee_id TO ������ȣ;

-- ����1) employees ���̺��� job_id �� 'ST_MAN'�� �������� �� ���̺� stmans�� ����� �Է��϶�
-- �� ���̺��� �÷� �̸��� id,job,sal(�������̺��� employee_id,job_id,salary)
CREATE TABLE stmans
as
SELECT employee_id,job_id,salary
FROM employees
where job_id = 'ST_MAN';

ALTER TABLE stmans
RENAME COLUMN employee_id TO id;
ALTER TABLE stmans
RENAME COLUMN job_id TO job;
ALTER TABLE stmans
RENAME COLUMN salary TO sal;

SELECT*FROM stmans;






