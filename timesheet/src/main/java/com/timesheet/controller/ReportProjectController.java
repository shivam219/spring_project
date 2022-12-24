package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.dto.EmployeeProjectDto;
import com.timesheet.model.MonthSheet;
import com.timesheet.model.Project;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.service.ProjectService;

@Controller
public class ReportProjectController {

	@Autowired
	ProjectRepository pr;

	@Autowired
	ProjectService ps;

	/*
	 * Access report project page
	 */
	@GetMapping(value = "/report-project")
	public ModelAndView getReportCustomre(@RequestParam("projectId") Project p) {
		ModelAndView m = new ModelAndView("report-project");
		m.addObject("p", p);
		m.addObject("empList", ps.getProjectEmloyeeDetails(p.getProjectId()));
		return m;
	}

	/*
	 * Fetch project employee sheet
	 */
	@PostMapping("/fetch-project-employee-sheet")
	public ResponseEntity<Object> monthSheetEmployee(@RequestParam Integer projectId) {
		List<EmployeeProjectDto> li = ps.findEmployeeNameAndHourInProject(projectId);
		if (li.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("No data");
		} else {
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(li);
		}
	}
}
