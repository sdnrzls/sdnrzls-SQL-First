-- ����1) �μ���ȣ�� 10���� �μ��� ����� �����ȣ,�̸�,������ ����϶�
SELECT empno,ename,sal
FROM emp
WHERE deptno = 10;

-- ����2) �����ȣ�� 7369�� ��� �� �̸� �Ի��� �μ���ȣ�� ����϶�
SELECT ename,hiredate,deptno
FROM emp
WHERE empno = 7369;

-- ����3) �̸��� ALLEN�� ����� ��� ������ ����϶�
SELECT*
FROM emp
where ename = 'ALLEN';

-- ����4) �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ���
SELECT ename,deptno,sal
FROM emp
where hiredate = '81/02/20';

-- ����5) ������ MANAGER�� �ƴ� ����� ������� ���
SELECT*
FROM emp
where job != 'MANAGER';

-- ����6)�Ի����� 81/04/02 ���Ŀ� �Ի��� ��� ���� ���
SELECT*
FROM emp
WHERE hiredate >= '81/04/02';

-- ����7) �޿��� $800 �̻��� ����� �̸�,�޿�,�μ���ȣ ���
SELECT ename,sal,deptno
FROM emp
where sal >= 800;

-- ����8) �μ���ȣ�� 20�� �̻��� ����� ��� ������ ���
SELECT*
FROM emp
WHERE deptno >= 20;

-- ����9) �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ��� ������� ���
SELECT*
FROM emp
where ename < 'k';

-- ����10) �Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ���
SELECT*
FROM emp
where hiredate <= '81/12/09';






















