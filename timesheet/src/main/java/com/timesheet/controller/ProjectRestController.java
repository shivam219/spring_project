package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.dto.ProjectDto;
import com.timesheet.dto.converter.ProjectConverter;
import com.timesheet.model.Project;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.service.ProjectService;

@RestController
public class ProjectRestController {
	@Autowired
	ProjectService ps;

	@Autowired
	ProjectRepository pr;

	@Autowired
	ProjectConverter pc;

	@GetMapping("/user-project")
	public ResponseEntity<List<ProjectDto>> getAssignProjectById(@RequestParam("empId") long empId) {
		List<ProjectDto> modelToDto = pc.modelToDto(pr.findByEmpId(empId));
		return ResponseEntity.of(Optional.of(modelToDto));
	}

	@GetMapping("/non-user-project")
	public ResponseEntity<List<ProjectDto>> getNonAssignProjectByEmpId(@RequestParam("empId") long empId) {
		List<ProjectDto> modelToDto = pc.modelToDto(pr.findnNonByEmpId(empId));
		return ResponseEntity.of(Optional.of(modelToDto));
	}
//	@GetMapping("/fetchprojectemp")
//	public ResponseEntity<List<Project>> getAssignProjectById(@RequestParam("empId") long empId) {
//		
//		return ResponseEntity.of(Optional.of(ps.getProjectByEmpId(empId)));
//	}
//	
//	@GetMapping("/fetchnonprojectemp")
//	public ResponseEntity<List<Project>> getNonAssignProjectByEmpId(@RequestParam("empId") long empId) {
//		
//		return ResponseEntity.of(Optional.of(ps.getNonAssignProjectByEmpId(empId)));
//	}

}
