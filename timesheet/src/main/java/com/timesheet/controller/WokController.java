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

import com.timesheet.model.Work;
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService;

@Controller
public class WokController {

	@Autowired
	WorkService workService;

	@Autowired
	ProjectService projectservice;
 
	@GetMapping("/esswork")
	public String esswork(Model m, HttpServletRequest request) {
		// session need to check later by spring security need to learn it
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		long empId = (Long) request.getSession().getAttribute("empId");
		m.addAttribute("projectList", projectservice.getProjectByEmpId(empId));
		return "esswork";
	}

	@GetMapping("/fetchwork")
	public String fetchByDate(Model m ,HttpServletRequest request ,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate) {
		
		m.addAttribute("workList", workService.getWorByStartDateEndDate(startDate, endDate));
		System.out.println(m.getAttribute("workList").toString());
		long empId = (Long) request.getSession().getAttribute("empId");
		m.addAttribute("projectList", projectservice.getProjectByEmpId(empId));
		return "esswork";
	}

	@PostMapping("/savework")
	public ResponseEntity<Object> saveWork(Model m, @RequestBody List<Work> work) {
		if (workService.saveAllWork(work)) {
			return ResponseEntity.status(HttpStatus.CREATED).body("Save data");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not save error");
		}
	}

}


//return ResponseEntity.of(Optional.of(work));
//return ResponseEntity.status(HttpStatus.OK).body(work);
//return ResponseEntity.of(Optional.of();
