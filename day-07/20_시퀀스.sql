--������
CREATE SEQUENCE ������1; -- ����
DROP SEQUENCE ������1; -- ����

--������ �̸����� ������ ���� ���
SELECT*FROM user_sequences
WHERE sequence_name = '������1';

--������ �׽�Ʈ ��� ���̺�
SELECT ������1.nextval FROM dual; --���������.nextval(���� INCREMENT ��ŭ ����)
SELECT ������1.currval FROM dual; --���������.currval ���簪(���� ���������ʴ� ���簪)

--������ �׽�Ʈ�� ���̺�  ����
CREATE TABLE �μ�_�׽�Ʈ(
�μ���ȣ NUMBER PRIMARY KEY,
�μ��̸� VARCHAR2(100)
);
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������1.nextval, '������');
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������1.nextval, '��ߺ�');
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������1.nextval, 'ȸ���');
COMMIT; --��������
SELECT*FROM �μ�_�׽�Ʈ;

--������ �ɼ� ���
--������2 ���� -���۰��� 10,�������� 20
DROP SEQUENCE ������2; -- ����

CREATE SEQUENCE ������2 -- ����
START with 10 -- 10������ ����
INCREMENT BY 20; -- �������� 20

DELETE FROM �μ�_�׽�Ʈ; --�μ� �׽�Ʈ ���̺��� ��� �� ����

INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '������');
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '��ߺ�');
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, 'ȸ���');
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '�����ú�');
INSERT INTO �μ�_�׽�Ʈ(�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '������');

COMMIT; --��������
SELECT*FROM �μ�_�׽�Ʈ;

--������1�� �μ���ȣ�� ������Ʈ
UPDATE �μ�_�׽�Ʈ
SET �μ���ȣ=������1.nextval;

--���̺� ����
DROP TABLE �μ�_�׽�Ʈ;
DROP SEQUENCE ������1;
DROP SEQUENCE ������2;
DROP TABLE DEPT CASCADE CONSTRAINTS; -- �������ǵ� �Բ�����
DROP TABLE EMP;
DROP TABLE EMP1;
DROP TABLE EMP2;
DROP TABLE EX_DATE;
DROP TABLE MEMEBERS;





