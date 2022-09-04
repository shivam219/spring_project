package com.timesheet.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Project;

public interface ProjectRepository extends CrudRepository<Project, Integer> {

	 
	@Query(value = "SELECT * FROM ess_project WHERE project_id IN (SELECT project_id FROM ess_employee_project WHERE emp_id = :empId )" 
	,nativeQuery = true) 
	public List<Project> getProjectByEmpId( @Param("empId") long empId);
	
	@Query(value = "SELECT * FROM ess_project WHERE project_id NOT IN (SELECT project_id FROM ess_employee_project WHERE emp_id = :empId )" 
			,nativeQuery = true) 
			public List<Project> getNonAssignProjectByEmpId( @Param("empId") long empId);
	
	@Modifying
	@Query(value="delete from ess_employee_project where emp_id = :empId",	nativeQuery = true)
	@Transactional
	public int deleteByEmpId(long empId);
}
