-- UPDATE : 데이터 수정하기

-- 업데이트 사용시 where절에 항상 기본키를 활용한다.
CREATE TABLE copy_emp
AS
SELECT* FROM employees;

UPDATE copy_emp
SET salary = 24100
where employee_id = 100;
commit;
--기본키가 아닌경우 의도치않게 다른 행도 업데이트
UPDATE copy_emp
SET salary = 24100
where first_name = 'Steven';
--where절을 사용하지 않을경우 
UPDATE copy_emp
SET phone_number = '123-456-789';



--예제1) departments 테이블의 'Music'부서의 매니저와 location ID를 업데이트하시오
INSERT INTO copy_departments(department_id,department_name)
VALUES(280,'Music');
COMMIT;
UPDATE copy_departments
SET manager_id=100,location_id=1800
WHERE department_id = 280;
COMMIT;

--예제2) copy_departments 테이블에서 department_id 150부터 200까지 부서번호의
--manager_id를 100으로 수정하라
UPDATE copy_departments
SET manager_id = 100
WHERE department_id BETWEEN 150 and 200;
commit;



