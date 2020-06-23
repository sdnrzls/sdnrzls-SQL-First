--시퀀스
CREATE SEQUENCE 시퀀스1; -- 생성
DROP SEQUENCE 시퀀스1; -- 삭제

--시퀀스 이름으로 시퀀스 정보 출력
SELECT*FROM user_sequences
WHERE sequence_name = '시퀀스1';

--시퀀스 테스트 듀얼 테이블
SELECT 시퀀스1.nextval FROM dual; --시퀀스사용.nextval(값을 INCREMENT 만큼 증가)
SELECT 시퀀스1.currval FROM dual; --시퀀스사용.currval 현재값(값을 증가하지않는 현재값)

--시퀀스 테스트용 테이블  생성
CREATE TABLE 부서_테스트(
부서번호 NUMBER PRIMARY KEY,
부서이름 VARCHAR2(100)
);
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스1.nextval, '영업부');
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스1.nextval, '계발부');
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스1.nextval, '회계부');
COMMIT; --영구저장
SELECT*FROM 부서_테스트;

--시퀀스 옵션 사용
--시퀀스2 생성 -시작값을 10,증가값을 20
DROP SEQUENCE 시퀀스2; -- 삭제

CREATE SEQUENCE 시퀀스2 -- 생성
START with 10 -- 10번부터 시작
INCREMENT BY 20; -- 증가값이 20

DELETE FROM 부서_테스트; --부서 테스트 테이블의 모든 행 삭제

INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스2.nextval, '영업부');
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스2.nextval, '계발부');
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스2.nextval, '회계부');
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스2.nextval, '마케팅부');
INSERT INTO 부서_테스트(부서번호, 부서이름)
VALUES (시퀀스2.nextval, '교육부');

COMMIT; --영구저장
SELECT*FROM 부서_테스트;

--시퀀스1로 부서번호를 업데이트
UPDATE 부서_테스트
SET 부서번호=시퀀스1.nextval;

--테이블 삭제
DROP TABLE 부서_테스트;
DROP SEQUENCE 시퀀스1;
DROP SEQUENCE 시퀀스2;
DROP TABLE DEPT CASCADE CONSTRAINTS; -- 제약조건도 함께삭제
DROP TABLE EMP;
DROP TABLE EMP1;
DROP TABLE EMP2;
DROP TABLE EX_DATE;
DROP TABLE MEMEBERS;





