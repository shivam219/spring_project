package com.timesheet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Employee;
import com.timesheet.model.Project;
import com.timesheet.repository.ProjectRepository;

@Component
public class ProjectService {

	@Autowired
	ProjectRepository repository;

	public List<Project> getAllProject() {
		return (List<Project>) repository.findAll();
	}

	public List<Project> getProjectByEmpId(long empId) {
		return (List<Project>) repository.getProjectByEmpId(empId);
	}

	public List<Project> getNonAssignProjectByEmpId(long empId) {
		return (List<Project>) repository.getNonAssignProjectByEmpId(empId);
	}

	public int deleteByEmpId(long empId) {
		return repository.deleteByEmpId(empId);
	}

	public Project save(Project p) {
		repository.save(p);
		return p;
	}

	public int deleteProjectByProjectId(long ProjectId) {
		// TODO Auto-generated method stub
		return repository.deleteProjectByProjectId(ProjectId);
	}
}
