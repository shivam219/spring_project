SELECT * FROM ess.ess_employee;

alter table ess.ess_employee add column emp_password_encrypt2 varchar(30) after emp_password_encrypt;

alter table  ess.ess_employee modify column  emp_password_encrypt2 varchar(40);
SET SQL_SAFE_UPDATES = 0;

update   ess.ess_employee set emp_password_encrypt2 = sha1('root') ;
alter table ess.ess_employee   drop  column emp_password_encrypt;
alter table ess.ess_employee    rename column emp_password_encrypt2 to emp_password_encrypt;
SELECT * FROM ess_employee WHERE CAST(AES_DECRYPT(emp_password_encrypt, 'pass') AS CHAR) = sha1('root');
INSERT INTO `ess`.`ess_employee`
(`emp_id`,
`emp_name`,
`emp_email`,
`emp_password`,
`emp_password_encrypt`,
`emp_password_encrypt2`,
`emp_phone`,
`emp_city`,
`emp_pincode`,
`emp_address`)
VALUES
( 5,
'shivam',
'shivam@219.com',
'root',
 AES_ENCRYPT( 'root' , 'pass' ),
 sha1('root'),
8779750059,
'mumbai',
'421201',
'mumbai') ;

SELECT  
AES_DECRYPT(AES_ENCRYPT('ABC', 'key_string'), 'key_string'); 

SELECT   
ENCODE('geeksforgeeks', 'passwordstring'); 
