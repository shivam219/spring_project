package com.timesheet.repository;

import java.util.List;

import javax.persistence.Tuple;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.model.MonthSheet;

@Repository
public interface MonthSheetRepository extends CrudRepository<MonthSheet, Long> {

	@Query(value = "select * from timesheet_month_sheet where emp_id = :empId and month(month) = :month and year(month) =:year ", nativeQuery = true)
	public MonthSheet findByEmpId(@Param("empId") Long empId, @Param("month") int month, @Param("year") int year);

	@Query(value = "\n" + "SELECT  m.month_sheet_id, concat( first_name , ' ' ,last_name ) employee_name , \n"
			+ "date_format(submit_date,' %D %b' ) as submit_date  , month(m.month)  monthh  , year(m.month)  yearr\n"
			+ "FROM ess.timesheet_month_sheet m,  timesheet_employee_master e\n"
			+ "where m.emp_id in  (select emp_id from timesheet_user_master where manager_id = :managerId) and submit ='Y' and approved ='N' and m.emp_id = e.emp_id\n"
			+ "", nativeQuery = true)
	public List<Tuple> findMonthSheetAndSubmit(long managerId);

	@Query(value = "select p.project_name , date_format( d.date , ' %D %b') , d.descr ,d.hour from timesheet_day_sheet d, timesheet_project_master p\n"
			+ "where d.project_id = p.project_id and month_id = :monthId  order by date ", nativeQuery = true)
	public List<Tuple> findMonthSheetDataAndApprove2(long monthId);

	@Query(value = "select\n"
			+ "    date_format( d.date,' %D %b'),\n"
			+ "    if(count(date)=1,group_concat(p.project_name), group_concat(p.project_name SEPARATOR '@' )),\n"
			+ "    if(count(date)=1,group_concat(d.descr),group_concat(d.descr SEPARATOR '@')),\n"
			+ "    if(count(date)=1 ,group_concat(d.hour) ,group_concat(d.hour SEPARATOR '@')) ,\n"
			+ "    sum(d.hour)\n"
			+ "from\n"
			+ "    timesheet_day_sheet d, timesheet_project_master p\n"
			+ "where d.project_id = p.project_id and month_id = :monthId group by  date order by date",nativeQuery = true)
	public List<Tuple> findMonthSheetDataViewToDto(long monthId);
	
	@Query(value = "SELECT m.month_sheet_id ,concat(e.first_name , ' ' , e.last_name  ) as employeeName ,  m.submit_date,\n"
			+ " month(m.month) month, year(m.month) year  FROM timesheet_month_sheet m , timesheet_employee_master e\n"
			+ "where m.emp_id = e.emp_id and m.month_sheet_id =:monthId" + "", nativeQuery = true)
	public List<Tuple> findMonthSheetEmployeeDataByMonthId(long monthId);

	@Query(value = "\n" + "with project as(\n" + "	SELECT  project_name , project_id from  timesheet_project_master\n"
			+ "	where project_id in  (\n"
			+ "	SELECT distinct(project_id) FROM ess.timesheet_day_sheet where month_id = :monthId) \n" + ")\n"
			+ "select count(ds.project_id) , p.project_name from  timesheet_day_sheet ds  , project p \n"
			+ "where ds.project_id = p.project_id and ds.month_id = :monthId  group by ds.project_id;\n"
			+ "", nativeQuery = true)
	public List<Tuple> findMonthSheetEmployeeChart(long monthId);
	
	
	

}
