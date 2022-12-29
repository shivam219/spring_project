package com.timesheet.repository;

import java.util.List;

import javax.persistence.Tuple;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.dto.ProjectWiseOvershot;
import com.timesheet.model.Project;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Integer> {

	@Query(value = "SELECT * FROM timesheet_project_master WHERE project_id IN (SELECT project_id FROM timesheet_employee_project_mapping WHERE emp_id = :empId )", nativeQuery = true)
	public List<Project> getProjectByEmpId(@Param("empId") long empId);

	@Query(value = "SELECT * FROM timesheet_project_master WHERE project_id NOT IN (SELECT project_id FROM timesheet_employee_project_mapping WHERE emp_id = :empId )", nativeQuery = true)
	public List<Project> getNonAssignProjectByEmpId(@Param("empId") long empId);

	@Modifying
	@Query(value = "delete from timesheet_employee_project_mapping where emp_id = :empId", nativeQuery = true)
	@Transactional
	public int deleteByEmpId(long empId);

	@Modifying
	@Query(value = "delete from timesheet_project_master where project_id = :ProjectId", nativeQuery = true)
	@Transactional
	public int deleteProjectByProjectId(long ProjectId);

	@Query(value = "select project_name from  timesheet_project_master where customer_id = :customerId", nativeQuery = true)
	public List<String> findProjectNameByCustomerId(@Param("customerId") String customerId);

	@Query(value = "SELECT * FROM ess.timesheet_project_master p where p.project_id in ( SELECT project_id FROM ess.timesheet_user_project_mapping where emp_id = :empId)", nativeQuery = true)
	public List<Project> findByEmpId(@Param("empId") Long empId);

	@Query(value = "SELECT * FROM ess.timesheet_project_master p where p.project_id not in ( SELECT project_id FROM ess.timesheet_user_project_mapping where emp_id = :empId)", nativeQuery = true)
	public List<Project> findnNonByEmpId(@Param("empId") Long empId);

	@Query(value = "select concat(first_name,' ',last_name) , UGRP_DESC from timesheet_user_master um , timesheet_employee_master em , timesheet_user_group_master gm , "
			+ "timesheet_user_group_mapping ugm" + "where "
			+ "um.emp_id in  (select emp_id from timesheet_user_project_mapping where  project_id = :projectId ) "
			+ "and um.active = 1 and  um.emp_id =  em.emp_id and  em.emp_id = ugm.emp_id  and ugm.ugrp_code = gm.UGRP_CODE order by first_name "
			+ "", nativeQuery = true)
	public List<Tuple> findEmployeeNameAndGroupDesc(Integer projectId);

	@Query(value = "\n" + "with mon as (\n"
			+ "select  um.emp_id  , concat(em.first_name,' ', em.last_name)  as name , ugm.UGRP_DESC , :projectId as project_id from \n"
			+ "timesheet_employee_master em  ,\n" + "timesheet_user_master um , \n"
			+ "timesheet_user_group_master ugm ,\n" + "timesheet_user_group_mapping ugmp\n" + "where \n"
			+ "em.emp_id = um.emp_id and um.emp_id = ugmp.emp_id and ugmp.ugrp_code = ugm.UGRP_CODE and\n"
			+ "um.emp_id in (select emp_id from timesheet_user_project_mapping where  project_id = :projectId ) \n"
			+ "and um.active = 1 \n" + ") \n"
			+ "select name , UGRP_DESC , ifnull(getHourByEmpId(emp_id,project_id),0 )  from mon", nativeQuery = true)
	public List<Tuple> findEmployeeNameAndGroupDescAndHour(Integer projectId);

	@Query(value = "with ees as("
			+ " select  concat(em.first_name) as name  , um.emp_id ,  ms.month_sheet_id from timesheet_user_master um , timesheet_employee_master em  , timesheet_month_sheet ms"
			+ "	where "
			+ "	um.emp_id in  (select emp_id from timesheet_user_project_mapping where  project_id = :projectId ) "
			+ "	and um.active = 1 and  um.emp_id =  em.emp_id  and  um.emp_id = ms.emp_id  " + " )"
			+ "select  e.name , sum(hour)  from timesheet_day_sheet ds , ees e where ds.month_id = e.month_sheet_id and ds.project_id = :projectId  GROUP BY  e.emp_id;"
			+ " ", nativeQuery = true)
	public List<Tuple> findEmployeeNameAndHourInProject(Integer projectId);

	@Query(value = "with mon as ( "
			+ "			select  um.emp_id  , concat(em.first_name,' ', em.last_name)  as name , ugm.UGRP_DESC , :projectId as project_id from "
			+ "			timesheet_employee_master em  , " + "			timesheet_user_master um , "
			+ "			timesheet_user_group_master ugm , " + "			timesheet_user_group_mapping ugmp "
			+ "			where "
			+ "			em.emp_id = um.emp_id and um.emp_id = ugmp.emp_id and ugmp.ugrp_code = ugm.UGRP_CODE and\n"
			+ "			 um.emp_id in (select emp_id from timesheet_user_project_mapping where  project_id = :projectId ) "
			+ "			 and um.active = 1 " + "			 ) "
			+ "    select name , UGRP_DESC , ifnull(getHourByEmpIdAndStartDateAndEndDate(emp_id,project_id, :startDate, :endDate),0 ) hours from mon where  ifnull(getHourByEmpIdAndStartDateAndEndDate(emp_id,project_id, :startDate, :endDate),0 ) > 0 "
			+ "    union  all select '<b>Total Hours</b>','', sum( ifnull(getHourByEmpIdAndStartDateAndEndDate(emp_id,project_id, :startDate, :endDate),0 ) ) from mon ", nativeQuery = true)
	public List<Tuple> findEmployeeNameAndGroupDescAndHourByStartDateAndDate(Integer projectId, String startDate,
			String endDate);

	@Query(value = "select  project_name, (datediff(now(),create_time) * 100) / project_day from timesheet_project_master where  customer_id = :customerId", nativeQuery = true)
	public List<Tuple> findProjectNameAndProjectProgress(Integer customerId);

	@Query(value = "select ifnull(sum(hour),0 )from timesheet_day_sheet where project_id = :projectId", nativeQuery = true)
	public Integer findTotalHourByProjectId(Integer projectId);

	@Query(value = "select project_name , sum(hour) p_tol_hour, (project_day*24) p_exp_hour from timesheet_project_master pm , timesheet_day_sheet ds where  pm.project_id = ds.project_id group by  project_name ,project_day", nativeQuery = true)
	public List<Tuple> findProjectNameAndWorkingHourAndExpected();

	@Query(name = "find_project_wise_overshot", nativeQuery = true)
	List<ProjectWiseOvershot> findStockAkhirPerProductIn();

}
