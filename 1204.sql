--  ���߷� ����
--  ��Ÿ���� <���������� ���ִ°� �������̿�>
--  ��������
--
--  �����ð� �ֹ� �� ��ȸ
--  �̹��ð� 
--
--  ǥ�����ι��

--  ��ǥ�� �������̰�
SELECT  o.�ֹ���ȣ, o.�ֹ���,
        p.��ǰ��, p.������ü, p.�ܰ�

FROM    �ֹ� o, ��ǰ p
WHERE   o.�ֹ���ǰ = p.��ǰ��ȣ; 

SELECT  o.�ֹ���ȣ,o.�ֹ���,
        p.��ǰ��,p.������ü,p.�ܰ�
        
FROM    �ֹ� o JOIN ��ǰ p
ON      (o.�ֹ���ǰ = p.��ǰ��ȣ)
WHERE   o.���� > 5;


--  �μ� ���ǹ�..

SELECT ���
FROM ��
WHERE ���̸� ='����ȭ';
SELECT *
FROM ��
WHERE ��� = 'gold';

--  �������� ()��ȣ �� �������� ()��ȣ ��
--  ������������ ; �����ʴ´�

SELECT *
FROM ��
WHERE ���  =(SELECT ���
              FROM ��
              WHERE ���̸� ='����ȭ')
AND ������ > (SELECT ������
            FROM ��
            WHERE ���̸� = '����ȭ');

-- �׷��Լ�
SELECT *
FROM ��
WHERE ������ = (SELECT MAX(������)
                FROM ��);
                
SELECT MAX  (������)
FROM ��
GROUP BY ���;

--  ������
--  ������������ ����� ������ �ϳ��� ���;��Ѵ�
--  ���߰��� �����°��� ��������� 
--  =�� IN���� �ٲٸ� ���߰��� ��µȴ� 

SELECT *
FROM ��
WHERE ������ = (SELECT MAX (������)
                FROM ��
                GROUP BY ���);

SELECT *
FROM �ֹ�;
SELECT �ֹ���ȣ, TO_CHAR (�ֹ�����,'YYYY/MM/DD hh24:mi:ss') �ֹ�����
FROM �ֹ�;

--  = > IN
--  <> > NOT IN
--  >=, <=, >, <, �񱳴� +ANY,ALL �� �Է�

SELECT *
FROM ��
WHERE ������ > ANY (SELECT MAX(������)
              FROM ��
              GROUP BY ���);

--  EXISTS = ���迡 �ȳ��� (�������)
--  NOT EXISTS = ���迡 �ȳ��� (�������)

--  IN�� ������ �������� �ݺ��ϰ� �� ���� ���
--  EXISTS �ѹ� �˻��ϸ� �ٷ� EXISTS

--  64�� ���迡 ������ �ʴ´�

--  SELECT �÷� WHERE �� ��� ORDER BY ���� GROUP SUM MAX ���
--  �׷������ ,����, ��������, NOT IN, IN
--  INSERT UPDATE DELIETE

--  ���̺� ������ �� �� ����
DESCRIBE ��ǰ;
DESC ��;

--  (INSERT ����)

INSERT INTO ��ǰ(��ǰ��,��ǰ��ȣ,������ü)
VALUES('����ٽ�','p08','�Ѻ�����');
SELECT *
FROM ��ǰ;


INSERT INTO ��ǰ
VALUES('p09','��īĨ',null,null, '�Ѻ�����');

SELECT *
FROM ��ǰ;

--  UPDATE ���̺��̸�
--  SET �Ӽ� = ��,....
--  [WHERE ����];

UPDATE ��ǰ
SET ��� = 1000, �ܰ� = 1500
WHERE ��ǰ��ȣ = 'p08';


SELECT *
FROM ��ǰ;

UPDATE ��ǰ
SET ��� = 1000, �ܰ� = 1500
WHERE ��ǰ��ȣ = 'P09';

SELECT *
FROM ��ǰ;

--  INSERT INTO ���̺��̸�[(�Ӽ��̸�,...)]
--  VALUES(��,....);


--  DELETE

DELETE FROM ���̺��̸� 
[WHERE ����]

--  INSERT
--  UPDATE
--  ������ ����Ȱ� �ƴϴ� 
--  COMMIT << ���������� (�Ѳ����� Ŀ�Ե�)
--  ROLLBACK << �ǵ�����  (�Ѳ����� �ѹ��)
--  TCL�̶���Ѵ� (�۾������� TRANSACION)

COMMIT;
UPDATE ��
SET ���� = 100;
DELETE FROM �ֹ�;
SELECT * FROM �ֹ�;
ROLLBACK;
SELECT * FROM �ֹ�;


