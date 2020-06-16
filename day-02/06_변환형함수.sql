--변환형 함수

--TO_CHAR
--숫자를 문자로 변환
--콤마(,)
SELECT TO_CHAR(12345678,'999,999,999') comma --12.345.678
FROM DUAL;
--소수점(.)
SELECT TO_CHAR(123.45678,'999,999,999.99') period --123.46
FROM DUAL;
--$표시
SELECT TO_CHAR(12345678,'$999,999,999') dollar --$12,345,678
FROM DUAL;
--Local 화폐 표시 (현지통화)
SELECT TO_CHAR(12345678,'L999,999,999') Local --￦12,345,678
FROM DUAL;
-- 왼쪽에 0을 삽입
SELECT TO_CHAR(123,'09999') zero --00123
FROM DUAL;

--날짜를 문자로 변환
--년,월,일,시,분,초
SELECT to_char(SYSDATE,'YY/MM/DD HH24:MI:SS') 현재날짜
FROM DUAL;
--365일중 오늘이 몇일?
SELECT to_char(SYSDATE,'DDD') 해당일
FROM DUAL;
--오늘의 월?
SELECT to_char(SYSDATE,'MONTH') 해당월
FROM DUAL;

-- 예제 1)
SELECT employee_id, to_char(hire_date,'MM/DD')
FROM employees
where department_id = 100;

--예제 2)
SELECT first_name,to_char(salary,'$999,999.00')
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

-- TO_DATE (문자를 날짜로)
SELECT TO_DATE('2011-01-01','YYYY-MM-DD')
FROM DUAL;

-- TO_NUMBER (문자를 숫자로)
SELECT to_number('01210616')
FROM DUAL;



