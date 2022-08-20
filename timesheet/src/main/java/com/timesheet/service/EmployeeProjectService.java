package com.timesheet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.EmployeeProject;
import com.timesheet.repository.EmployeeProjectRepository;

@Component
public class EmployeeProjectService {

	public EmployeeProjectService() {
	}

	@Autowired
	private EmployeeProjectRepository EmployeeProjectRepository;
 
	/* -- save employe project by native insert query
	 * public int assignProject(long empId, int projectId) { return
	 * EmployeeProjectRepository.assignProject(empId, projectId); }
	 */
	
	public EmployeeProject assignProject2(EmployeeProject employeeProject) {
		EmployeeProject employeeProject2 =  null;
		try {
			employeeProject2 =EmployeeProjectRepository.save(employeeProject);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return employeeProject2;
	}

}
