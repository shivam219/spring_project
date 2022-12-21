package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.repository.EmployeeRepository;

@Controller
public class ReportTimesheetStatus {
	@Autowired
	EmployeeRepository er;

	@GetMapping("/report-month-check")
	public ModelAndView reportMonthCheck(HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");
		ModelAndView m = new ModelAndView("report-month-check");
		m.addObject("years", er.findEmployeeWorkingYear(empId));
		return m;
	}

}
