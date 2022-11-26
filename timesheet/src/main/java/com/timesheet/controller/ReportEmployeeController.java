package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.dto.EmployeeNameDto;
import com.timesheet.model.MonthSheet;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.service.EmployeeService;

@Controller
public class ReportEmployeeController {

	@Autowired
	EmployeeRepository er;
	@Autowired
	EmployeeService es;

	@GetMapping(value = "/report-month-employee")
	public String getEmployeeMonthReport(Model m) {
		List<EmployeeNameDto> findEmployeeName = es.findEmployeeName();
		m.addAttribute("employeeName", findEmployeeName);
		return "report-month-employee";
	}

	@GetMapping(value = "/fetch-employee-year")
	public ResponseEntity<List<String>> fetchEmployeeYear(@RequestParam long empId) {
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(er.findEmployeeWorkingYear(empId));
	}

	@GetMapping(value = "/fetch-employee-month")
	public ResponseEntity<List<String[]>> fetchEmployeeMonth(@RequestParam long empId, @RequestParam Integer yearCode) {
		List<String[]> m = er.findEmployeeWorkingMonth(empId, yearCode);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(er.findEmployeeWorkingMonth(empId, yearCode));
	}

	@PostMapping(value = "/report-month-employee-data")
	public String getEmployeeMonthData(@ModelAttribute MonthSheet ms , @RequestParam long empId) {
		System.out.println(empId);
		System.out.println(ms);
		return "report-month-employee-data";
	}

}
