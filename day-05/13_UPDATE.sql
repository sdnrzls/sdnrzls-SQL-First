-- UPDATE : ������ �����ϱ�

-- ������Ʈ ���� where���� �׻� �⺻Ű�� Ȱ���Ѵ�.
CREATE TABLE copy_emp
AS
SELECT* FROM employees;

UPDATE copy_emp
SET salary = 24100
where employee_id = 100;
commit;
--�⺻Ű�� �ƴѰ�� �ǵ�ġ�ʰ� �ٸ� �൵ ������Ʈ
UPDATE copy_emp
SET salary = 24100
where first_name = 'Steven';
--where���� ������� ������� 
UPDATE copy_emp
SET phone_number = '123-456-789';



--����1) departments ���̺��� 'Music'�μ��� �Ŵ����� location ID�� ������Ʈ�Ͻÿ�
INSERT INTO copy_departments(department_id,department_name)
VALUES(280,'Music');
COMMIT;
UPDATE copy_departments
SET manager_id=100,location_id=1800
WHERE department_id = 280;
COMMIT;

--����2) copy_departments ���̺��� department_id 150���� 200���� �μ���ȣ��
--manager_id�� 100���� �����϶�
UPDATE copy_departments
SET manager_id = 100
WHERE department_id BETWEEN 150 and 200;
commit;



