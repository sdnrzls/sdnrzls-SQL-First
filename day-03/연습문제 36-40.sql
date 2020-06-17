-- ����36) ������� 5���� �Ѵ� �μ��� �μ���� ����� ��ȸ
SELECT 
FROM emp
NATURAL JOIN dept
WHERE dept.deptno > 5;
-- ����37)������ �޿��հ谡 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������
-- ���޿� �հ踦 ��ȸ �� �Ǹſ�('SALESMAN')�� �����ϰ� �� �޿� �հ�� �������� ����
SELECT job,SUM(sal) �޿��հ�
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal)>5000
ORDER BY �޿��հ� DESC;

-- ����38)������� �����ȣ(empno),�����(ename),�޿�(sal),�޿����(grade)�� ����Ͻÿ�
--(���̺� salgrade ����)
SELECT empno,ename,sal,salgrade.grade
FROM emp
NATURAL JOIN salgrade;

-- ����39)�μ���(deptno)�� ����� ���� Ŀ�̼�(comm)�� ���� ����� ���� ���
SELECT deptno,COUNT(*),COUNT(comm)
FROM emp
GROUP BY deptno;



-- ����40)�μ���ȣ(depno)�� 10�� '�ѹ���',20��'���ߺ�',30��'������'��� �Ͽ�
-- �̸�,�μ���ȣ,�μ��� ������ ��� (decode �� case�Լ����)
SELECT ename,deptno,
    DECODE(deptno,10,'�ѹ���',
                  20,'���ߺ�',
                  30,'������')�μ���
FROM emp