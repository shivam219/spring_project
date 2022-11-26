package com.timesheet.dto.converter;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.timesheet.dto.ProjectDto;
import com.timesheet.model.Project;

@Component
public class ProjectConverter {

	public List<ProjectDto> modelToDto(List<Project> pl) {
		List<ProjectDto> pdl = new ArrayList<ProjectDto>();
		for (Project project : pl) {
			ProjectDto projectDto = new ProjectDto();
			projectDto.setProjectId(project.getProjectId());
			projectDto.setProjectName(project.getProjectName());
			pdl.add(projectDto);
		}
		return pdl;
	}
}
