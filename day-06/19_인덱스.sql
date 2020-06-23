--�ε���
CREATE TABLE members(
    member_id INT,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)-- �⺻Ű�� �ڵ����� �ε����� ������
);
--�ε��� ���
SELECT TABLE_NAME AS ���̺��,
        INDEX_NAME AS �ε�����,
        COLUMN_NAME AS �÷��̸�
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'MEMBERS';

SELECT * FROM members
WHERE last_name = 'Harse';

---------�ε��� ���� �� �˻�
EXPLAIN PLAN FOR --���̺� �˻� ���� ������ �������
SELECT * FROM members
WHERE last_name = 'Harse';

--������ ȭ�鿡 ���
SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());
-------
--�ε��� �ִ� �� �˻�. cost�� ���� ��
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE member_id = 139;

SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());
---


---�ε��� �����
CREATE INDEX members_last_name_i
ON members(last_name);

EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name = 'Shafto';

SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());


------------------
--�ε��� �����ϱ�.
--�ε����� ���̺��� �����Ǹ� ���� ������

DROP INDEX members_last_name_i;

--��Ƽ �ε��� �����. Į���� 2�� �̻� �����ָ� ��.

--����) ���� ������� MEMBERS ���̺���  first_name�� last_name�� ��Ƽ �ε����� ���� 
--�Ʒ��� �׸�ó�� ��  �ε������� ��ȸ��   ������ ����� ����϶�

CREATE INDEX members_names_i
ON members(last_name, first_name);

EXPLAIN PLAN FOR --���̺� �˻� ���� ������ �������
SELECT * FROM members
WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';
--������ ȭ�鿡 ���
SELECT PLAN_TABLE_OUTPUT 
FROM TABLE(DBMS_XPLAN.DISPLAY());

