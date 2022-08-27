SELECT * FROM ess.ess_employee;

SET SQL_SAFE_UPDATES = 0;
alter table ess.ess_employee drop column emp_password_encrypt;
alter table ess.ess_employee add  column emp_password_encrypt varchar(40) after emp_password;
update   ess.ess_employee set emp_password_encrypt = sha1('root') ;
SELECT * FROM ess_employee WHERE emp_password_encrypt = sha1('root');
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
