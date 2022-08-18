create database spring;

select * from student;
desc ess_employee;

drop table hibernate_sequence;
drop table Student;


--

create database spring;
use spring;
show tables;
truncate ess_employee;
 SELECT * FROM spring.ess_employee;
 drop table spring.ess_employee;
 select * from user;
 
 drop table user;
 create table user (id int, pass blob);
 insert into user(id ,pass) values (1 , AES_ENCRYPT('root','pass'));
 
 select  cast(aes_decrypt(pass, 'pass') AS char) from user;
 
 alter table ess_employee add column pass_encrypt blob after emp_password;

insert into user(emp_id , emp_name, emp_email, emp_password,emp_password_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) 
values (12,'shivam', 'shivam@219', 'root',  AES_ENCRYPT('root','pass') , 'mumbai' , 'mumbai' ,'87797' ,'421201' );
 
insert into ess_employee (emp_id , emp_name, emp_email, emp_password,emp_password_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) 
values (13,'shivam', 'shivam@219', 'root',  AES_ENCRYPT('root','pass') , 'mumbai' , 'mumbai' ,'87797' ,'421201' );
 
 
 select  cast(aes_decrypt(emp_password_encrypt, 'pass') AS char) from ess_employee;
 
 select des_encrypt(emp_password, 'pass') as EC ,emp_password from ess_employee; 
 
 select * from ess_employee where cast(aes_decrypt(emp_password_encrypt, 'pass') AS char) = 'root' and emp_id = 13; 
  
 use spring;
 alter table ess_employee rename column pass_encrypt to emp_password_encrypt;
 
 select   emp_password_encrypt  from ess_employee;

INSERT INTO t
VALUES (1,AES_ENCRYPT('text', UNHEX(SHA2('My secret passphrase',512))));
 
 
 SELECT  CONCAT('*', UPPER(SHA1(UNHEX(SHA1('pass'))))); 
 
 SELECT password( CONCAT('*', UPPER(SHA1(UNHEX(SHA1('pass'))))) );

 alter table ess_employee add column emp_password_encrypt2 varchar(512)  after emp_password;
 
insert into ess_employee (emp_id , emp_name, emp_email, emp_password,emp_password_encrypt2, emp_city ,emp_address,emp_phone,emp_pincode) 
values (16,'priyanka', 'priyanka@219', 'root',   CONCAT('*', UPPER(SHA2(UNHEX(SHA2('root', 'pass'))) ))   , 'mumbai' , 'mumbai' ,'87797' ,'421201' );
 
 select * from ess_employee  where emp_name = 'priyanka' and emp_password_encrypt2 = CONCAT('*', UPPER(SHA2(UNHEX(SHA2('root')))))
 