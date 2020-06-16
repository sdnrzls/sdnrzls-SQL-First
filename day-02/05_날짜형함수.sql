-- ��¥�� �Լ�
SELECT first_name, hire_date --��¥���� ������
FROM employees;

-- sysdate ���� ��¥�� �ð�
SELECT SYSDATE -- ���� ��¥�� �ð�
FROM DUAL;

-- ��¥ + ���� => ��¥
 SELECT SYSDATE ,SYSDATE +3, SYSDATE -3
 FROM DUAL;
 
-- ��¥ -��¥ = �� �ϼ�
SELECT employee_id, SYSDATE, hire_date,
    SYSDATE - hire_date,ROUND(SYSDATE-hire_date)
FROM employees;

--�ð����
SELECT SYSDATE + 5/24 --�ð� 1(�Ϸ�)
FROM DUAL;

-- months_between : ���� ���
SELECT employee_id,first_name,
    ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)),
    (SYSDATE - hire_date)/30
FROM employees;

-- ADD_MONTHS(��¥,���� ����)
SELECT employee_id,first_name,hire_date,
    ADD_MONTHS(hire_date,4)
FROM employees;

-- NEXT_DAY(��¥, ������ ���� ����)
SELECT SYSDATE, NEXT_DAY(SYSDATE,'������')
FROM DUAL;

-- LAST_DAY(��¥) �� ���� ��������
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;

-- ��¥�� �ݿø�
SELECT employee_id, hire_date,
        ROUND(hire_date, 'MONTH') ��, -- ������ �ݿø� 1��
        ROUND(hire_date, 'YEAR') �� -- ������ �ݿø� 1��
FROM employees
where Months_BETWEEN(sysdate, hire_date) < 150;

-- ���� 1)
SELECT hire_date,SYSDATE ,MONTHS_BETWEEN(SYSDATE,hire_date)
FROM employees
where department_id = 100;

-- ���� 2)
SELECT hire_date,ADD_MONTHS(hire_date,3)���ϱ�_3����,ADD_MONTHS(hire_date,-3) ����_3����
FROM employees
where employee_id between 100 and 106;