-- DELETE 데이터의 삭제

-- 71번~75번 부서번호 삭제
DELETE FROM departments
WHERE department_id BETWEEN 71 and 75;
commit;

DELETE FROM departments
WHERE department_id IN(271,272,273);
commit;

DELETE FROM employees
WHERE employee_id IN(1,2);
commit;

--테이블 내용 전체를 삭제 : Rollback 가능
DELETE FROM copy_departments;
ROLLBACK;

--TRUNCATE TABLE : 전체 삭제인데 Rollback이 안됨
TRUNCATE TABLE copy_departments;

-- DROP 테이블 : 테이블 삭제
DROP TABLE copy_departments;
DROP TABLE copy_EMP;
DROP TABLE XX_EMP;

--세이브 포인트
SELECT * FROM copy_emp
WHERE employee_id = 108;
--salary값이 12008

UPDATE copy_emp
SET salary = salary +10
where employee_id = 108;
--salary값이 12018
--세이브 포인트 A 만들기
SAVEPOINT A;

UPDATE copy_emp
SET salary = salary +20
where employee_id = 108;
--salary 12038

--세이브포인트 A로 롤백
ROLLBACK TO SAVEPOINT A;
--salary 값 12018
ROLLBACK;
commit;

