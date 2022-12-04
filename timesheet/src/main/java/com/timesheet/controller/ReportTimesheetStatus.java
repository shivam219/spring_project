package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportTimesheetStatus {

	@GetMapping("/report-month-check")
	public ModelAndView reportMonthCheck(HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");
		ModelAndView m = new ModelAndView("report-month-check");
		return m;
	}

}
