CREATE TABLE MEMBER 
(
  ID NUMBER NOT NULL 
, MEM_ID VARCHAR2(20) 
, MEM_PW VARCHAR2(20) 
, MEM_NAME VARCHAR2(20) 
, MEM_BIRTH VARCHAR2(20) 
, MEM_EMAIL VARCHAR2(20) 
, MEM_PHONE VARCHAR2(20) 
, MEM_GENDER VARCHAR2(20) 
, MEM_GRADE VARCHAR2(20)
, MEM_JOINDATE VARCHAR2(20)
, CONSTRAINT MEMBER_PK PRIMARY KEY 
  (
    ID 
  )
  ENABLE 
);


Test

insert into member values(mem_seq.nextval,'admin1','1234','a','a','a','a','a','A','2018-08-08');
insert into member values(mem_seq.nextval,'1','1','1','1','1','1','1','B','2018-08-08');
insert into member values(mem_seq.nextval,'2','2','2','2','2','2','2','B','2018-08-08');
insert into member values(mem_seq.nextval,'3','3','3','3','3','3','3','B','2018-08-08');
insert into member values(mem_seq.nextval,'4','4','4','4','4','4','4','B','2018-08-08');
insert into member values(mem_seq.nextval,'5','5','5','5','5','5','5','B','2018-08-08');
insert into member values(mem_seq.nextval,'6','6','6','6','6','6','6','B','2018-08-08');
insert into member values(mem_seq.nextval,'7','7','7','7','7','7','7','B','2018-08-08');
insert into member values(mem_seq.nextval,'8','8','8','8','8','8','8','B','2018-08-08');
insert into member values(mem_seq.nextval,'9','9','9','9','9','9','9','B','2018-08-08');
insert into member values(mem_seq.nextval,'10','10','10','10','10','10','10','B','2018-08-08');
insert into member values(mem_seq.nextval,'11','11','11','11','11','11','11','B','2018-08-08');
insert into member values(mem_seq.nextval,'12','12','12','12','12','12','12','B','2018-08-08');
insert into member values(mem_seq.nextval,'13','13','13','13','13','13','13','B','2018-08-08');
insert into member values(mem_seq.nextval,'14','14','14','14','14','14','14','B','2018-08-08');
insert into member values(mem_seq.nextval,'15','15','15','15','15','15','15','B','2018-08-08');
insert into member values(mem_seq.nextval,'16','16','16','16','16','16','16','B','2018-08-08');
insert into member values(mem_seq.nextval,'17','17','17','17','17','17','17','B','2018-08-08');
insert into member values(mem_seq.nextval,'18','18','18','18','18','18','18','B','2018-08-08');
insert into member values(mem_seq.nextval,'19','19','19','19','19','19','19','B','2018-08-08');
insert into member values(mem_seq.nextval,'20','20','20','20','20','20','20','B','2018-08-08');
insert into member values(mem_seq.nextval,'21','21','21','21','21','21','21','B','2018-08-08');
insert into member values(mem_seq.nextval,'22','22','22','22','22','22','22','B','2018-08-08');
insert into member values(mem_seq.nextval,'23','23','23','23','23','23','23','B','2018-08-08');
insert into member values(mem_seq.nextval,'24','24','24','24','24','24','24','B','2018-08-08');
insert into member values(mem_seq.nextval,'25','25','25','25','25','25','25','B','2018-08-08');
insert into member values(mem_seq.nextval,'26','26','26','26','26','26','26','B','2018-08-08');
insert into member values(mem_seq.nextval,'27','27','27','27','27','27','27','B','2018-08-08');
insert into member values(mem_seq.nextval,'28','28','28','28','28','28','28','B','2018-08-08');
insert into member values(mem_seq.nextval,'29','29','29','29','29','29','29','B','2018-08-08');

commit
