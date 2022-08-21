package com.timesheet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.timesheet.model.Work;
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService;

@Controller
public class WeeklyReportController {

	@Autowired
	WorkService workService;
	
	@Autowired
	ProjectService projectservice;

//	@ModelAttribute
//	public void commonDataModl(Model m ,Long empId) {
//	}
  
	@GetMapping("/esswork")
	public String esswork(Model m , HttpServletRequest request) {
		//session need to check later by spring security need to learn it
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
	 	long empId = (Long)  request.getSession().getAttribute("empId");
	 	m.addAttribute("projectList", projectservice.getProjectByEmpId(empId));
		return "esswork";
	}
 
  
	@PostMapping("/saveWork")
	public ResponseEntity<Object> saveWork(Model m ,@RequestBody List<Work> work) {
//		return ResponseEntity.of(Optional.of(work));
//		return ResponseEntity.status(HttpStatus.OK).body(work);
//		return ResponseEntity.of(Optional.of();
		if (workService.saveAllWork(work)) {
			return ResponseEntity.status(HttpStatus.CREATED).body("Save data");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not save error");
		}
	}

	
}
