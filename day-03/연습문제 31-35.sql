-- ����31)�μ���ȣ�� ASCENDING SORT���� �޿��� ���� ��������� ���
SELECT*
FROM emp
ORDER BY deptno , sal DESC;

-- ����32)�μ���ȣ�� DESCENDING SORT�ϰ� �̸������� ASCENDING �޿������� DES ���
SELECT deptno,ename,sal
FROM emp
ORDER BY deptno DESC,ename,sal DESC;

-- ����33)10�� �μ��� ��� �������� �޿��� 13% ���ʽ� ���� �̸�,�޿�,���ʽ��ݾ�,�μ���ȣ ���
SELECT ename, sal, ROUND(sal*0.13) ���ʽ��ݾ�,deptno
FROM emp
where deptno = 10;

-- ����34)���� �̸�,�޿�,Ŀ�̼�,�Ѿ�(Ŀ�̼�+�޿�)�� ���Ͽ� �Ѿ��� ���� ������ ���
SELECT ename,sal,NVL(comm,0),sal+NVL(comm,0) TOTAL
FROM emp
ORDER BY TOTAL DESC;

--����35)�޿��� 1500���� 3000������ ����� ���ؼ��� �޿��� 15%ȸ��� �����ϱ�� �Ͽ���
--��� ����� �̸�,�޿�,ȸ��(�Ҽ����� 2�ڸ����� �ݿø�)�� ���
--(�� ȸ��� �޷�ǥ�÷� �����ϰ� �Ҽ��� 1�ڸ����� ���)
SELECT ename,sal,to_char(sal-(sal*0.85),'$999,999,999.0') ȸ��
FROM emp
WHERE sal BETWEEN 1500 AND 3000;







