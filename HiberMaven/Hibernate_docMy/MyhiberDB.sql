use myhiber;
create database myhiber;
drop table STUDENT;
drop table Student_Address;

alter table STUDENT add column city varchar(30);

select * from STUDENT;
desc Student_Address;

update Student_Address set city = 'nandivali' where address_id =1; 

select * from Student_Address;

drop table prod_supplier;
drop table supplier;
drop table price;
drop table conn;
drop table prod;
commit;

show tables;
drop table student ,student_address;
-- upate to late updaiton so use commit while updating data realtime
show tables;



CREATE TABLE timesheet_leave_master(
emp_id VARCHAR(20),
emp_name VARCHAR(30),
manager_id VARCHAR(20),
manager_name VARCHAR(30),
daymode VARCHAR(10),
leave_type VARCHAR(10),
leave_reason VARCHAR(15),
start_date VARCHAR(15),
end_date VARCHAR(15),
approve_by VARCHAR(20),
attachment VARCHAR(100),
aprrove_status varchar(10)
);
ALTER TABLE leave_application ADD COLUMN approve_by VARCHAR(30) AFTER leave_reason;
ALTER TABLE leave_application MODIFY attachment VARCHAR(100);	







