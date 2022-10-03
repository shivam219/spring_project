package com.timesheet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.timesheet.service.EmployeeService;
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService;

@Controller
public class WokController {

	@Autowired
	WorkService workService;

	@Autowired
	EmployeeService employeeService;

	@Autowired
	ProjectService projectservice;

	@GetMapping("/work")
	public String work(Model m, HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "redirect:/login";
		}
		return "work";
	}

	@GetMapping("/work-approve")
	public String workApprove(Model m, HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "redirect:/login";
		}
		m.addAttribute("empList", employeeService.getAllEmployee());

		return "work-approve";
	}

	@PostMapping("/savework")
	public ResponseEntity<Object> saveWork(Model m, @RequestBody List<Work> work) {
		if (workService.saveAllWork(work)) {
			return ResponseEntity.status(HttpStatus.CREATED).body("Shivam prahsnat");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not save error");
		}
	}

	@PostMapping("/deletework")
	public ResponseEntity<Object> deleteWork(Model m, @RequestBody List<Work> work) {
		if (workService.deleteAllWork(work)) {
			return ResponseEntity.status(HttpStatus.RESET_CONTENT).body("delete data");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not save error");
		}
	}

	@GetMapping(value = "/submit-work")
	public ResponseEntity<Object> submitWorkReport(HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");

		workService.submitWork(empId, "2022-08-11", "2022-08-18");
		return ResponseEntity.status(HttpStatus.RESET_CONTENT).body("Data submitted");
	}

	@GetMapping(value = "/approve-work")
	public ResponseEntity<Object> approveWorkReport(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("empId") Long empId) {
		System.out.println("Approvework");
		return ResponseEntity.status(HttpStatus.OK).body("Approve");
	}

	@GetMapping(value = "/reject-work")
	public ResponseEntity<Object> rejectWorkReport(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("empId") Long empId) {
		System.out.println("Reject ework");
		return ResponseEntity.status(HttpStatus.OK).body("reject");
	}

//	
//	@GetMapping(value = "/submitWork")
//	public ResponseEntity<Object> submitWorkReport( HttpServletRequest request, @RequestParam("startDate") String startDate,
//			@RequestParam("endDate") String endDate) {
//		long empId = (Long) request.getSession().getAttribute("empId");
//		
//		workService.submitWork(empId,startDate,endDate);
//		return ResponseEntity.status(HttpStatus.RESET_CONTENT).body("Data submitted");
//	}

}

//return ResponseEntity.of(Optional.of(work));
//return ResponseEntity.status(HttpStatus.OK).body(work);
//return ResponseEntity.of(Optional.of();
