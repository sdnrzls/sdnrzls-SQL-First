-- ����21)�̸� �� S�ڰ� ���ִ� ����� ������� ���
SELECT*
FROM emp
where ename Like '%S%';

-- ����22) �̸��� M���� �����ϰ� ���������ڰ� N�� ����� ��� ���� ���
SELECT*
FROM emp
where ename LIKE 'M%' AND ename Like '%N';

-- ����23)�̸��� ù ��° ���ڴ� �������,�ι�° ���ڰ� A�� ����� ������ ���
SELECT*
FROM emp
where ename Like '_A%';

-- ����24)Ŀ�̼��� NULL�� ����� ������ ����϶� (IS NULL �Ǵ� IS NOT NULL���)
SELECT*
FROM emp
where comm IS NULL;

-- ����25)Ŀ�̼��� NULL�� �ƴѻ���� ������� ���
SELECT*
FROM emp
where comm IS NOT NULL;

-- ����26)�μ��� 30�� �μ��̰� �޿��� 1,500�̻��� ����� �̸�,�μ�,�������
SELECT ename,deptno,sal
FROM emp
where deptno = 30 AND sal >= 1500;

-- ����27)�̸��� ù ���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ,�̸�,�μ���ȣ ���
SELECT empno,ename,deptno
FROM emp
where ename Like 'K%' or deptno =30;

-- ����28)�޿��� 1500 �̻��̰� �μ���ȣ�� 30���� ����� ������ MANNAGER�� ��� ���� ���
SELECT*
FROM emp
where sal >= 1500 AND deptno = 30 AND job ='MANAGER';

-- ����29)�μ���ȣ�� 30�� ����� ��� ������ ����ϰ� ������ȣ�� SORT(����)�϶�
SELECT*
FROM emp
where deptno = 30
ORDER BY empno ;

-- ����30)�������� �޿��� ���� ������ sortgkfk
SELECT*
FROM emp
ORDER BY sal DESC;




















