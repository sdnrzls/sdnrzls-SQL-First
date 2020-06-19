-- DELETE �������� ����

-- 71��~75�� �μ���ȣ ����
DELETE FROM departments
WHERE department_id BETWEEN 71 and 75;
commit;

DELETE FROM departments
WHERE department_id IN(271,272,273);
commit;

DELETE FROM employees
WHERE employee_id IN(1,2);
commit;

--���̺� ���� ��ü�� ���� : Rollback ����
DELETE FROM copy_departments;
ROLLBACK;

--TRUNCATE TABLE : ��ü �����ε� Rollback�� �ȵ�
TRUNCATE TABLE copy_departments;

-- DROP ���̺� : ���̺� ����
DROP TABLE copy_departments;
DROP TABLE copy_EMP;
DROP TABLE XX_EMP;

--���̺� ����Ʈ
SELECT * FROM copy_emp
WHERE employee_id = 108;
--salary���� 12008

UPDATE copy_emp
SET salary = salary +10
where employee_id = 108;
--salary���� 12018
--���̺� ����Ʈ A �����
SAVEPOINT A;

UPDATE copy_emp
SET salary = salary +20
where employee_id = 108;
--salary 12038

--���̺�����Ʈ A�� �ѹ�
ROLLBACK TO SAVEPOINT A;
--salary �� 12018
ROLLBACK;
commit;

