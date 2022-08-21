package com.timesheet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Project;
import com.timesheet.repository.ProjectRepository;

@Component
public class ProjectService {

	@Autowired
	ProjectRepository projectRepository;
	public List<Project> getAllProject() {
		return (List<Project>) projectRepository.findAll();
	}
	public  List<Project> getProjectByEmpId(long empId ) {
		return (List<Project>) projectRepository.getProjectByEmpId(empId);
	}
}
