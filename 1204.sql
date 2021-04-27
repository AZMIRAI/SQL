--  내추럴 조인
--  세타조인 <조인조건을 써주는것 연산자이용>
--  조인조건
--
--  지난시간 주문 고객 조회
--  이번시간 
--
--  표준조인방식

--  비표준 조인임이게
SELECT  o.주문번호, o.주문고객,
        p.제품명, p.제조업체, p.단가

FROM    주문 o, 제품 p
WHERE   o.주문제품 = p.제품번호; 

SELECT  o.주문번호,o.주문고객,
        p.제품명,p.제조업체,p.단가
        
FROM    주문 o JOIN 제품 p
ON      (o.주문제품 = p.제품번호)
WHERE   o.수량 > 5;


--  부속 질의문..

SELECT 등급
FROM 고객
WHERE 고객이름 ='정소화';
SELECT *
FROM 고객
WHERE 등급 = 'gold';

--  서브쿼리 ()괄호 안 메인쿼리 ()괄호 밖
--  서브쿼리에는 ; 하지않는다

SELECT *
FROM 고객
WHERE 등급  =(SELECT 등급
              FROM 고객
              WHERE 고객이름 ='정소화')
AND 적립금 > (SELECT 적립금
            FROM 고객
            WHERE 고객이름 = '정소화');

-- 그룹함수
SELECT *
FROM 고객
WHERE 적립금 = (SELECT MAX(적립금)
                FROM 고객);
                
SELECT MAX  (적립금)
FROM 고객
GROUP BY 등급;

--  오류문
--  서브쿼리에선 결과가 무조건 하나만 나와야한다
--  다중값이 나오는것은 오류가뜬다 
--  =을 IN으로 바꾸면 다중값이 출력된다 

SELECT *
FROM 고객
WHERE 적립금 = (SELECT MAX (적립금)
                FROM 고객
                GROUP BY 등급);

SELECT *
FROM 주문;
SELECT 주문번호, TO_CHAR (주문일자,'YYYY/MM/DD hh24:mi:ss') 주문일자
FROM 주문;

--  = > IN
--  <> > NOT IN
--  >=, <=, >, <, 비교는 +ANY,ALL 을 입력

SELECT *
FROM 고객
WHERE 적립금 > ANY (SELECT MAX(적립금)
              FROM 고객
              GROUP BY 등급);

--  EXISTS = 시험에 안나옴 (어려워서)
--  NOT EXISTS = 시험에 안나옴 (어려워서)

--  IN은 여러번 같은것을 반복하고 다 보고 출력
--  EXISTS 한번 검색하면 바로 EXISTS

--  64번 시험에 내지는 않는다

--  SELECT 컬럼 WHERE 행 결과 ORDER BY 집계 GROUP SUM MAX 등등
--  그룹바이저 ,조인, 서브쿼리, NOT IN, IN
--  INSERT UPDATE DELIETE

--  테이블 구조를 볼 수 있음
DESCRIBE 제품;
DESC 고객;

--  (INSERT 예제)

INSERT INTO 제품(제품명,제품번호,제조업체)
VALUES('쿠쿠다스','p08','한빛제과');
SELECT *
FROM 제품;


INSERT INTO 제품
VALUES('p09','포카칩',null,null, '한빛제과');

SELECT *
FROM 제품;

--  UPDATE 테이블이름
--  SET 속성 = 값,....
--  [WHERE 조건];

UPDATE 제품
SET 재고량 = 1000, 단가 = 1500
WHERE 제품번호 = 'p08';


SELECT *
FROM 제품;

UPDATE 제품
SET 재고량 = 1000, 단가 = 1500
WHERE 제품번호 = 'P09';

SELECT *
FROM 제품;

--  INSERT INTO 테이블이름[(속성이름,...)]
--  VALUES(값,....);


--  DELETE

DELETE FROM 테이블이름 
[WHERE 조건]

--  INSERT
--  UPDATE
--  완전히 저장된게 아니다 
--  COMMIT << 완전히저장 (한꺼번에 커밋됨)
--  ROLLBACK << 되돌리기  (한꺼번에 롤백됨)
--  TCL이라고한다 (작업단위를 TRANSACION)

COMMIT;
UPDATE 고객
SET 나이 = 100;
DELETE FROM 주문;
SELECT * FROM 주문;
ROLLBACK;
SELECT * FROM 주문;


