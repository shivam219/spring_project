package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.MonthSheetRepository;

@Controller
public class ReportTimesheetStatus {
	@Autowired
	EmployeeRepository er;

	@Autowired
	MonthSheetRepository mr;

	/*
	 * Access employee monthly status timesheet page
	 */
	@GetMapping("/report-month-check")
	public ModelAndView reportMonthCheck(HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");
		ModelAndView m = new ModelAndView("report-month-check");
		m.addObject("months", er.findMonth());
		m.addObject("years", er.findEmployeeWorkingYear(empId));
		return m;
	}

	@PostMapping("/report-month-check")
	public ModelAndView reportMonthCheckP(HttpServletRequest request, @RequestParam("year") String year,
			@RequestParam("month") String month) {
		 
		long empId = (Long) request.getSession().getAttribute("empId");
		ModelAndView m = new ModelAndView("report-month-check"); 
		m.addObject("months", er.findMonth());
		m.addObject("userMonth",month);
		m.addObject("years", er.findEmployeeWorkingYear(empId));
		m.addObject("userYear", year);
		m.addObject("data", mr.findAllByEmpIdAndSubmit(empId, month, year));
		return m;
	}

}
