package com.timesheet.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.EmployeeProject;

public interface EmployeeProjectRepository extends CrudRepository<EmployeeProject, Integer> {
	@Modifying
	@Query(value = "insert into ess_employee_project (emp_id, project_id) values(:empId, :projectId)", nativeQuery = true)
	@Transactional
	public int assignProject(@Param("empId") long empId, @Param("projectId") int projectId);
	
	
}
 