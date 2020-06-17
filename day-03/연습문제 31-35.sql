-- 문제31)부서번호로 ASCENDING SORT한후 급여가 많은 사람순으로 출력
SELECT*
FROM emp
ORDER BY deptno , sal DESC;

-- 문제32)부서번호가 DESCENDING SORT하고 이름순으로 ASCENDING 급여순으로 DES 출력
SELECT deptno,ename,sal
FROM emp
ORDER BY deptno DESC,ename,sal DESC;

-- 문제33)10번 부서의 모든 직원에게 급여의 13% 보너스 지급 이름,급여,보너스금액,부서번호 출력
SELECT ename, sal, ROUND(sal*0.13) 보너스금액,deptno
FROM emp
where deptno = 10;

-- 문제34)직원 이름,급여,커미션,총액(커미션+급여)를 구하여 총액이 많은 순서로 출력
SELECT ename,sal,NVL(comm,0),sal+NVL(comm,0) TOTAL
FROM emp
ORDER BY TOTAL DESC;

--문제35)급여가 1500부터 3000사이의 사원에 대해서만 급여의 15%회비로 지불하기로 하였다
--모든 사원의 이름,급여,회비(소수이하 2자리에서 반올림)을 출력
--(단 회비는 달러표시로 시작하고 소수점 1자리까지 출력)
SELECT ename,sal,to_char(sal-(sal*0.85),'$999,999,999.0') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000;







