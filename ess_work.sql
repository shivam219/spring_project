create table ess_week_work( work_id int primary key  auto_increment,emp_name varchar(30)  );

create table ess_week_work_report(work_id int,  work_item varchar(30),activity varchar(10) ,
status varchar(10), mon varchar(10), mon_des varchar(50) ,tue varchar(10), tue_des varchar(50),
wed varchar(10), wed_des varchar(50), thu varchar(10), thu_des varchar(50),
fri varchar(10), fri_des varchar(50), sat varchar(10), sat_des varchar(50), 
sun varchar(10), sun_des varchar(50)
 );
insert into ess_week_work values(1,'prashat_july_1');
insert into ess_week_work values(2,'priyanka_july_1');
select * from ess_week_work;	
alter table ess_week_work add column start_date varchar(10) after emp_name;  
alter table ess_week_work add column end_date varchar(10) after start_date; 
update ess_week_work set start_date = '2022-07-01' , end_date = '2022-07-07' where work_id = 1;

use spring;
insert into ess_projects values(1,'Timesheet App Developement','active');
insert into ess_projects values(2,'TechM-GE','active');
insert into ess_projects values(3,'Outsystems-RBL support','active');
insert into ess_projects values(4,'AppD-HDFC bank','active');
select * from ess_projects;

