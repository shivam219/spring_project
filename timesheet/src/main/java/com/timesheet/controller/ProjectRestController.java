package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.Project;
import com.timesheet.service.ProjectService;

@RestController
public class ProjectRestController {
	@Autowired
	ProjectService ps;

	@GetMapping("/fetchprojectemp")
	public ResponseEntity<List<Project>> getAssignProjectById(@RequestParam("empId") long empId) {
	 
		return ResponseEntity.of(Optional.of(ps.getProjectByEmpId(empId)));
	}

	@GetMapping("/fetchnonprojectemp")
	public ResponseEntity<List<Project>> getNonAssignProjectByEmpId(@RequestParam("empId") long empId) {
	 
		return ResponseEntity.of(Optional.of(ps.getNonAssignProjectByEmpId(empId)));
	}

}
