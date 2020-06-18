-- 문제36) 사원수가 5명이 넘는 부서의 부서명과 사원수 조회
SELECT d.dname, COUNT(e.empno)
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) > 5;

-- 문제37)직업별 급여합계가 5000을 초과하는 각 직무에 대해서 직무와
-- 월급여 합계를 조회 단 판매원('SALESMAN')은 제외하고 월 급여 합계로 내림차순 정렬
SELECT job,SUM(sal) 급여합계
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal)>5000
ORDER BY 급여합계 DESC;

-- 문제38)사원들의 사원번호(empno),사원명(ename),급여(sal),급여등급(grade)를 출력하시오
--(테이블 salgrade 조인)
SELECT e.empno,e.ename,e.sal,s.grade
FROM emp e
JOIN salgrade s
on e.sal BETWEEN s.losal and s.hisal;

-- 문제39)부서별(deptno)로 사원의 수와 커미션(comm)을 받은 사원의 수를 출력
SELECT deptno,COUNT(*)사원수,COUNT(comm) 커미션받은사원수
FROM emp
GROUP BY deptno;

-- 문제40)부서번호(depno)가 10은 '총무부',20은'개발부',30은'영업부'라고 하여
-- 이름,부서번호,부서명 순으로 출력 (decode 나 case함수사용)
SELECT ename,deptno,
    DECODE(deptno,10,'총무부',
                  20,'개발부',
                  30,'영업부')부서명
FROM emp;