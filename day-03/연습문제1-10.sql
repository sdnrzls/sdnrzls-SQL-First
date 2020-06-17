-- 문제1) 부서번호가 10번인 부서의 사람중 사원번호,이름,월급을 출력하라
SELECT empno,ename,sal
FROM emp
WHERE deptno = 10;

-- 문제2) 사원번호가 7369인 사람 중 이름 입사일 부서번호를 출력하라
SELECT ename,hiredate,deptno
FROM emp
WHERE empno = 7369;

-- 문제3) 이름이 ALLEN인 사람의 모든 정보를 출력하라
SELECT*
FROM emp
where ename = 'ALLEN';

-- 문제4) 입사일이 81/02/20인 사원의 이름, 부서번호, 월급을 출력
SELECT ename,deptno,sal
FROM emp
where hiredate = '81/02/20';

-- 문제5) 직업이 MANAGER가 아닌 사람의 모든정보 출력
SELECT*
FROM emp
where job != 'MANAGER';

-- 문제6)입사일이 81/04/02 이후에 입사한 사원 정보 출력
SELECT*
FROM emp
WHERE hiredate >= '81/04/02';

-- 문제7) 급여가 $800 이상인 사람의 이름,급여,부서번호 출력
SELECT ename,sal,deptno
FROM emp
where sal >= 800;

-- 문제8) 부서번호가 20번 이상인 사원의 모든 정보를 출력
SELECT*
FROM emp
WHERE deptno >= 20;

-- 문제9) 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람 모든정보 출력
SELECT*
FROM emp
where ename < 'k';

-- 문제10) 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력
SELECT*
FROM emp
where hiredate <= '81/12/09';






















