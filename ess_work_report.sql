select * from ess_week_work_report;
alter table ess_week_work_report add constraint foreign key(work_id) references ess_week_work(work_id);
insert into ess_week_work_report values(1,'ess organization website', 'production' ,'active' ,
 '1' ,'building website' ,'','',  '','',  
 '','', '','', '','' , '' ,''
);
insert into ess_week_work_report values(1,'deloitte', 'live' ,'active' ,
 '7' ,'deployed' ,'','',  '','',  
 '','', '','', '','' , '' ,''
);
SET SQL_SAFE_UPDATES = 0;
update ess_week_work_report set sat = 8 ,  sat_des = 'work from home' where work_id = 1 and  work_item <> 'deloitte';
delete from ess_week_work_report where work_item = 'deloitte' ;






