package com.timesheet.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.Tuple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.dto.EmployeeProjectDto;
import com.timesheet.model.Project;
import com.timesheet.repository.ProjectRepository;

@Component
public class ProjectService {

	@Autowired
	ProjectRepository repository;

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
		return repository.deleteProjectByProjectId(ProjectId);
	}

//	 gm.UGRP_DESC
	public List<EmployeeProjectDto> getProjectEmloyeeDetails(Integer projectId) {
		List<Tuple> tu = repository.findEmployeeNameAndGroupDescAndHour(projectId);
		List<EmployeeProjectDto> epd = tu.stream().map(
				e -> new EmployeeProjectDto(e.get(0, String.class), 
						e.get(1, String.class),
						e.get(2, BigInteger .class)))
				.collect(Collectors.toList());
		return epd;
	}

	public List<EmployeeProjectDto> findEmployeeNameAndHourInProject(Integer projectId) {
		List<Tuple> tu = repository.findEmployeeNameAndHourInProject(projectId);

		List<EmployeeProjectDto> epd = tu.stream()
				.map(e -> new EmployeeProjectDto(e.get(0, String.class), e.get(1, BigDecimal.class)))
				.collect(Collectors.toList());
		return epd;
	}

}
