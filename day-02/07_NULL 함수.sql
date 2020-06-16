-- NULL �����Լ�

-- NVL : �ΰ��� �ٸ� ������ �ٲܶ� ��� 
SELECT last_name, manager_id, NVL(manager_id,0) �Ŵ���
FROM employees
WHERE last_name = 'King';

-- NVL2(ex,ex1,ex2) :
-- ex���� NULL���� �ƴϸ� ex1 NULL���̸� ex2
SELECT last_name, NVL2(manager_id,1,0)�Ŵ���
FROM employees
WHERE last_name = 'King';

-- NULLIF(ex1,ex2): ex1�� ex2���� �����ϸ� NULL
-- �������� ������ ex1 �� ���
SELECT NULLIF(1,1),NULLIF(1,2)
FROM DUAL;

-- COALESCE(ex1,ex2,ex3,....)
-- ex1�� �ΰ��̸� ex2 ��ȯ, ex2�� �ΰ��̸� ex3��ȯ..
SELECT last_name �̸�, salary ����, commission_pct Ŀ�̼�,
        COALESCE((salary+ (commission_pct*salary)), salary+2000)�����λ�
FROM employees
ORDER BY 3;

-- ���� 1)
SELECT last_name �̸�,salary ����, NVL(commission_pct,0) Ŀ�̼�,
salary*12 +salary *12*NVL(commission_pct,0) ����
FROM employees
ORDER BY ���� DESC;

-- ���� 2)
SELECT last_name �̸�,salary ����, NVL(commission_pct,0) Ŀ�̼�,
salary*12 +salary *12*NVL(commission_pct,0) ����,
NVL2(commission_pct,'SAL+COMM','SAL')�������
FROM employees
ORDER BY ���� DESC;

-- ���� 3)
SELECT first_name, LENGTH(first_name) ���ڼ�1,
last_name,LENGTH(last_name) ���ڼ�2,
NULLIF(LENGTH(first_name),LENGTH(last_name))���
FROM employees;

--DECODE �Լ�
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG', salary*1.10,
                    'ST_CLERK', salary*1.15,
                    'SA_REP', salary*1.20,
                            salary) "��������"
FROM employees;

-- ���� 1)
SELECT last_name �̸�, job_id ����, salary ����,
    DECODE(TRUNC(salary/2000),0,0,
                            1,0.09,
                            2,0.20,
                            3,0.30,
                            4,0.40,
                            5,0.42,
                            6,0.44,
                            0.45) ����                                       
FROM employees;

--CASE

--���� 1)
SELECT job_id, employee_id, first_name, last_name,salary,
    CASE WHEN salary >= 9000 THEN '�����޿�'
         WHEN salary >= 6000 THEN '�����޿�'
         ELSE '�����޿�'
         END "�޿����"
FROM employees
WHERE job_id = 'IT_PROG';















