-- 문제21)이름 주 S자가 들어가있는 사람만 모든정보 출력
SELECT*
FROM emp
where ename Like '%S%';

-- 문제22) 이름이 M으로 시작하고 마지막글자가 N인 사람의 모든 정보 출력
SELECT*
FROM emp
where ename LIKE 'M%' AND ename Like '%N';

-- 문제23)이름이 첫 번째 문자는 관계없고,두번째 문자가 A인 사람의 정보를 출력
SELECT*
FROM emp
where ename Like '_A%';

-- 문제24)커미션이 NULL인 사람의 정보를 출력하라 (IS NULL 또는 IS NOT NULL사용)
SELECT*
FROM emp
where comm IS NULL;

-- 문제25)커미션이 NULL이 아닌사람의 모든정보 출력
SELECT*
FROM emp
where comm IS NOT NULL;

-- 문제26)부서가 30번 부서이고 급여가 1,500이상인 사람의 이름,부서,월급출력
SELECT ename,deptno,sal
FROM emp
where deptno = 30 AND sal >= 1500;

-- 문제27)이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호,이름,부서번호 출력
SELECT empno,ename,deptno
FROM emp
where ename Like 'K%' or deptno =30;

-- 문제28)급여가 1500 이상이고 부서번호가 30번인 사원중 직업이 MANNAGER인 사람 정보 출력
SELECT*
FROM emp
where sal >= 1500 AND deptno = 30 AND job ='MANAGER';

-- 문제29)부서번호가 30인 사람의 모든 정보를 출력하고 직원번호로 SORT(정렬)하라
SELECT*
FROM emp
where deptno = 30
ORDER BY empno ;

-- 문제30)직원들의 급여가 많은 순으로 sortgkfk
SELECT*
FROM emp
ORDER BY sal DESC;




















