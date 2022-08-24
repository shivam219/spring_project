package com.timesheet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.Work2;
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService2;

@Controller
public class WokController2 {

	@Autowired
	WorkService2 workService;

	@Autowired
	ProjectService projectservice;

	@GetMapping("/esswork2")
	public String esswork2(Model m, HttpServletRequest request) {
		// session need to check later by spring security need to learn it
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		long empId = (Long) request.getSession().getAttribute("empId");
		m.addAttribute("projectList", projectservice.getProjectByEmpId(empId));
		return "esswork2";
	}
 
	@PostMapping("/fetchwork2")
	public String fetchByDate2(Model m, HttpServletRequest request, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {

		long empId = (Long) request.getSession().getAttribute("empId");
		m.addAttribute("workList", workService.getWorkByStartDateEndDate(startDate, endDate, empId));
		m.addAttribute("projectList", projectservice.getProjectByEmpId(empId));
		return "esswork2";
	}

	@PostMapping("/savework2")
	public ResponseEntity<Object> saveWork(Model m, @RequestBody List<Work2> work2) {
		if (workService.saveAllWork(work2)) {
			return ResponseEntity.status(HttpStatus.CREATED).body("Save data");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not save error");
		}
	}
}