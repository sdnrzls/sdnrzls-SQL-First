SELECT*FROM emp WHERE empno=7369;
--테이블 생성
DROP TABLE NAMECARD;
CREATE TABLE NAMECARD(
NO NUMBER CONSTRAINT PK_NAMECARD PRIMARY KEY,
NAME VARCHAR2(20) NOT NULL,
MOBILE VARCHAR2(20) NOT NULL,
EMAIL VARCHAR2(40),
COMPANY VARCHAR2(60)
);
--시퀀스 생성
DROP SEQUENCE CARD_NO;
CREATE SEQUENCE CARD_NO;

INSERT INTO NAMECARD VALUES(
    CARD_NO.NEXTVAL,
    'LALA',
    '010-1234-5678',
    'LALA@naver.com',
    'Naver Com'
);

SELECT*FROM NAMECARD;

SELECT*FROM NAMECARD ORDER BY NO;
COMMIT;

SELECT * FROM NAMECARD; 