package com.timesheet.repository;

import java.util.List;

import javax.persistence.Tuple;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

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
//
//	@Query(value = " select project_id, project_name , project_status  ,   c.customer_id , c.customer_name as customer_name from timesheet_project_master p inner join timesheet_customer_master c where p.customer_id = c.customer_id" , nativeQuery = true)
//	public List<Project> getAllProject();

	@Query(value = "select project_name from  timesheet_project_master where customer_id = :customerId", nativeQuery = true)
	public List<String> findProjectNameByCustomerId(@Param("customerId") String customerId);

	@Query(value = "SELECT * FROM ess.timesheet_project_master p where p.project_id in ( SELECT project_id FROM ess.timesheet_user_project_mapping where emp_id = :empId)", nativeQuery = true)
	public List<Project> findByEmpId(@Param("empId") Long empId);

	@Query(value = "SELECT * FROM ess.timesheet_project_master p where p.project_id not in ( SELECT project_id FROM ess.timesheet_user_project_mapping where emp_id = :empId)", nativeQuery = true)
	public List<Project> findnNonByEmpId(@Param("empId") Long empId);

	@Query(value = "select concat(first_name,' ',last_name) , UGRP_DESC from timesheet_user_master um , timesheet_employee_master em , timesheet_user_group_master gm , \n"
			+ "timesheet_user_group_mapping ugm\n" + "where \n"
			+ "um.emp_id in  (select emp_id from timesheet_user_project_mapping where  project_id = :projectId ) \n"
			+ "and um.active = 1 and  um.emp_id =  em.emp_id and  em.emp_id = ugm.emp_id  and ugm.ugrp_code = gm.UGRP_CODE order by first_name \n"
			+ "", nativeQuery = true)
	public List<Tuple> findEmployeeNameAndGroupDesc(Integer projectId);

	@Query(value = "with ees as(\n"
			+ " select  concat(em.first_name,' ', em.last_name) as name  , um.emp_id ,  ms.month_sheet_id from timesheet_user_master um , timesheet_employee_master em  , timesheet_month_sheet ms\n"
			+ "	where \n"
			+ "	um.emp_id in  (select emp_id from timesheet_user_project_mapping where  project_id = :projectId ) \n"
			+ "	and um.active = 1 and  um.emp_id =  em.emp_id  and  um.emp_id = ms.emp_id  \n"
			+ " )\n"
			+ "select  e.name , sum(hour) from timesheet_day_sheet ds , ees e where ds.month_id = e.month_sheet_id  GROUP BY  e.emp_id\n"
			+ " ", nativeQuery = true)
	public List<Tuple> findEmployeeNameAndHourInProject(Integer projectId);

}
