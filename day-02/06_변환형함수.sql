--��ȯ�� �Լ�

--TO_CHAR
--���ڸ� ���ڷ� ��ȯ
--�޸�(,)
SELECT TO_CHAR(12345678,'999,999,999') comma --12.345.678
FROM DUAL;
--�Ҽ���(.)
SELECT TO_CHAR(123.45678,'999,999,999.99') period --123.46
FROM DUAL;
--$ǥ��
SELECT TO_CHAR(12345678,'$999,999,999') dollar --$12,345,678
FROM DUAL;
--Local ȭ�� ǥ�� (������ȭ)
SELECT TO_CHAR(12345678,'L999,999,999') Local --��12,345,678
FROM DUAL;
-- ���ʿ� 0�� ����
SELECT TO_CHAR(123,'09999') zero --00123
FROM DUAL;

--��¥�� ���ڷ� ��ȯ
--��,��,��,��,��,��
SELECT to_char(SYSDATE,'YY/MM/DD HH24:MI:SS') ���糯¥
FROM DUAL;
--365���� ������ ����?
SELECT to_char(SYSDATE,'DDD') �ش���
FROM DUAL;
--������ ��?
SELECT to_char(SYSDATE,'MONTH') �ش��
FROM DUAL;

-- ���� 1)
SELECT employee_id, to_char(hire_date,'MM/DD')
FROM employees
where department_id = 100;

--���� 2)
SELECT first_name,to_char(salary,'$999,999.00')
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

-- TO_DATE (���ڸ� ��¥��)
SELECT TO_DATE('2011-01-01','YYYY-MM-DD')
FROM DUAL;

-- TO_NUMBER (���ڸ� ���ڷ�)
SELECT to_number('01210616')
FROM DUAL;



