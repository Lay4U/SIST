-- ex01.sql

-- ���϶��� �ּ�

/*

    ���߶��� �ּ�
    ��������...    

*/


/*

�����ͺ��̽� ����(������) ��ȣ
- SYS
- SYSTEM

- java1234


Destination Folder: C:\oraclexe\
Oracle Home: C:\oraclexe\app\oracle\product\11.2.0\server\
Oracle Base:C:\oraclexe\
Port for 'Oracle Database Listener': 1521
Port for 'Oracle Services for Microsoft Transaction Server': 2030
Port for 'Oracle HTTP Listener': 8080








����Ŭ, Oracle
- ȸ���, ��ǰ��
- �����ͺ��̽�(Database) -> �����ͺ��̽� ���� �ý���(Database Management System, DBMS) -> ������ �����ͺ��̽� ���� �ý���(Relational DBMS, RDBMS)
- ������Ʈ�Ͻ� �� DBMS �� ���̾��? -> Oracle 11g ����߽��ϴ�.
- ������Ʈ�Ͻ� �� DB Ŭ���Ʈ�� �� ���̾��? -> SQL Developer ����߽��ϴ�.


�ٿ�ε�

1. OracleXE112_Win64.zip
    - �����ͺ��̽� ���α׷�(DMBS)

2. sqldeveloper-20.4.1.407.0006-x64.zip
    - �����ͺ��̽� Ŭ���̾�Ʈ ���α׷�
    


������, Data
- ������ ����
    
�����ͺ��̽�, Database
- �������� ����
- �������� ������ �����ϴ� ���α׷�
- ����Ŭ(Oracle)

�����ͺ��̽� ���� �ý���, Database Management System
- �����ͺ��̽� + �߰� �۾� -> ���� �ý���
- ����Ŭ(Oracle)

���� �ý����� �ʿ伺 -> �Ʒ��� ��ɵ��� ����

1. ������ ���Ἲ
    - �����Ϳ� ������ ������ �ȵȴ�.
    - ���� ����(Constraint)�� ����Ѵ�.
    
2. ������ ������
    - �����ͺ��̽��� ��ȭ�� �߻��ϴ��� ����� ���� ���α׷����� ������ ���� �ʴ´�.

3. ����
    - �����ͺ��̽����� �����͸� �Ժη� ���� ����
    - �����ֳ� ���� ������ �ִ� ����ڸ� ���� ����... ���� ����

4. ������ �ߺ� �ּ�ȭ
    - ������ �����Ͱ� �������� ������ ����Ǵ� ���� �����Ѵ�.

5. ������ ������
    - ������ ���/���� ��ɵ� �����Ѵ�.
    
    

DBMS ����
1. ������ DBMS
2. ���� DBMS
3. ������ DBMS > ���� > �����͸� ǥ���·� ����/����
4. ��ü������ DBMS
5. ��ü������ DBMS



������ �����ͺ��̽� ���� �ý��� -> ��ǰ ����

1. Oracle
    - Oracle
    - �����
    
2. MS-SQL
    - Microsoft
    - �����

3. MySQL
    - Oracle
    - ���ο� + �����

4. MariaDB
    - MySQL ���
    - ����
    - ���ο� + �����

5. PostgreSQL
    - ����Ʈ�׷���ť��
    - ����
    - ���ο� + �����
    
6. DB2
    - IBM
    - ����������
    
7. Access
    - MS
    - ���ο� + �ұԸ�
    
8. Ƽ����
    - Ƽ�ƽ�(TMax)

9. SQLite
    - �淮
    - ����� ��..



Oracle(�����ͺ��̽� ����)
-> UI�� ���� ���α׷� -> ����


�����ͺ��̽� Ŭ���̾�Ʈ ���α׷�
-> UI�� ���� ����Ŭ�� ������ �ؼ� -> ������ �����ִ� ��

1. SQL Developer
    - ����
    - Oracle

2. Toad
    - ����
    - ������ �ֻ�
    
3. SQLGate

4. DataGrip(JetBrain)
    - 30�� ����
    - ���б� �̸���(����)

5. Eclipse

6. SQL*Plus
    - ����Ŭ�� ��ġ�ϸ� �ڵ����� ���� ��ġ�Ǵ� Ŭ���̾�Ʈ ��
    - CLI(Command Line Interface)










������. ��Ʈ��. ����. ���ڱ� ����Ŭ �ȵǿ�... ? -> SQL Developer -> DB ����X



����Ŭ ����
- Oracle 11g Express Edition
- Oracle 1.0 ~ 21c

����Ŭ �����
- Express Edition
    - ����. ��� ����(���߿�). �������
    - 11g XE, 18c XE
- Enterprise Edition
    - ���
    
    



����Ŭ ��ġ
-> ����Ŭ�� �� �����ϰ� �ִ���???
-> ���� or ����??

1. cmd > services.msc

2. OracleXXX
    - OracleServiceXE(���� ��)
        - �����ͺ��̽� ���α׷�
    - OracleXETNSListener(���� ��)
        - ����Ŭ�� Ŭ���̾�Ʈ ���α׷��� ������� �ִ� ���α׷�






Name: �����ּ�.������
Name: localhost.system

����� �̸�: system
��й�ȣ: java1234
��й�ȣ ����: üũ

ȣ��Ʈ �̸�: ����Ŭ ���� �ּ�(������, IP)
��Ʈ: 1521
SID(���� �̸�): xe

localhost -> 127.0.0.1

oracl1
oracl2
oracl3



���� �ִ� ����
-> ��ũ��Ʈ ����(*.sql), ��ũ ��ũ ����(*.sql)
-> ����Ŭ(�����ͺ��̽�����)�� ��ȭ�� �ϱ� ���� �۾� ����(�ڹ� -> �ҽ�����(*.java))
-> ���� ���� ����


��ũ��Ʈ ���� ���
1. ������ ��ɾ�(����)�� �����Ѵ�.(�����)
    - ���콺
    - Shift + ����Ű(Home,End)
2. ����
    - Ctrl + Enter
    


����
1. ������ ����
    - sys, system

2. �Ϲ� ����� ����
    - ������ �Ϻ� ���ѵǾ� �ִ� ����
    - ����(���߿�)
    - �н��� ���� ���� > scott, hr(��� ���� -> ����)
    
*/


-- ������ ����ִ�. -> Ȱ��ȭ
-- alter user ������ account unlock;
alter user hr account unlock; --User HR��(��) ����Ǿ����ϴ�.

-- ��й�ȣ ����
alter user hr identified by java1234; --User HR��(��) ����Ǿ����ϴ�.

alter user hr account unlock identified by java1234;


-- system vs hr -> ? -> 154 vs 7
select * from tabs;


show user;


-- �����ͺ��̽� ���� ��ġ(����Ŭ ����) -> �����ͺ��̽� Ŭ���̾�Ʈ ��(SQL Developer) -> hr ���� Ȱ��ȭ -> DB ���� ����

/*

DB ���� ����

1. DBA
    - �����ͺ��̽� ������
    
2. DB ���α׷���
    - DB �۾� ����

3. ���� ���α׷���
    - DB �۾� �Ϻ�



localhost.hr
- ���̺�
- ��
- �ε���
- ��Ű��
- ���ν���
...
..
..


������ �����ͺ��̽�
- �����͸� ǥ���·� ����/�����Ѵ�.
- �����ͳ����� ���踦 �����Ѵ�.
- ǥ(���̺�)�� ����    


���̺�
- ��(�÷�)�� ���� > ���̺��� ���� > ��Ű��(Scheme)

��, Column
- �÷�, �ʵ�(Field), �Ӽ�(Attribute), Ư��(Property)
- ���� ����

��, Row
- ��, �ο�, ���ڵ�(Record), Ʃ��(Tuple)
- ���̺� ��üȭ�� ������ 1��
- Object(��ü)





Ŭ���̾�Ʈ <-> ����Ŭ
- SQL


SQL, Structured Query Language
- ����ȭ�� ���� ���
- �����(Ŭ���̾�Ʈ ��)�� ������ �����ͺ��̽��� ��ȭ�� �� ����ϴ� ���
- �ڹٿ� ���� �ڿ�� ������.

1. DBMS ���ۻ�� �������̴�.
- SQL�� ��� DBMS�� �����̴�.

2. ǥ�� SQL(ANSI-SQL)
- ��� DBMS�� ǥ�� SQL�� �����ϵ��� ����Ǿ� �ִ�.
- SQL-86 ... SQL92... SQL-2011

3. ��ȭ�� ����.
- ���� > �亯 > ���� > �亯 > ����...



SQL(����Ŭ ����)
1. ANSI SQL
    - ǥ�� SQL
    
2. PL/SQL
    - ��ü SQL
    - ����Ŭ������ ���۵Ǵ� ��ɾ�
    


ANSI SQL ����
- ��ɾ���� ���ݿ� ���� �з�

1. DDL
    - Data Definition Language
    - ������ ���Ǿ�
    - ������ ����� ���
    - ���̺�, ��, �����, �ε��� ���� ��ü(DB Object)�� ����,����,�����ϴ� ��ɾ�
    a. create : ����
    b. drop : ����
    c. alter : ����
    - �����ͺ��̽� ������
    - �����ͺ��̽� �����
    - ���α׷���(�Ϻ�)

2. DML
    - Data Manipulation Language
    - ������ ���۾�
    - �����ͺ��̽��� �����͸� �߰�,����,����,��ȸ�ϴ� ��ɾ�
    a. select : �б�(************************************)
    b. insert : �߰�
    c. update : ����
    d. delete : ����
    - �����ͺ��̽� ������
    - �����ͺ��̽� �����
    - ���α׷���(*******)

3. DCL
    - Data Control Language
    - ������ �����
    - ����, ����, Ʈ����� ���� ����
    a. commit
    b. rollback
    c. grant
    d. revoke
    - �����ͺ��̽� ������
    - �����ͺ��̽� �����
    - ���α׷���(�Ϻ�)

4. DQL
    - Data Query Language
    - ������ ���Ǿ�
    - DML �߿� select���� �̷��� ���� Ī�Ѵ�.

5. TCL
    - Transaction Control Language
    - DCL�߿� commit, rollback���� �̷��� ���� Ī�Ѵ�.



����Ŭ �⺻ ���ڵ�
- ~ 8i : EUC-KR
- 9i ~ : UTF-8

*/

-- ���� ����(HR)�� �����ϰ� �ִ� ���̺� ��� �����ּ���.

-- SQL�� Ű������ ��ҹ��ڸ� �������� �ʴ´�.
select * from tabs; -- ����
SELECT * FROM tabs; -- �� ���� ���

-- Alt + Ȭ����ǥ
SELECT * FROM TABS;

-- Ctrl + Space
SELECT
    *
FROM tabs;




















































