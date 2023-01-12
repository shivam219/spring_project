package com.timesheet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.dto.EmployeeHourDto;
import com.timesheet.service.MonthWiseSummary;

@Controller
public class ReportMonthWiseSummaryController {

	@Autowired
	MonthWiseSummary mws;

	/*
	 * Access month wise summary report page
	 */
	@GetMapping(value = "/month-wise-summary-report")
	public ModelAndView getMonthWiseSummaryReport() {
		ModelAndView m = new ModelAndView("month-wise-summary-report");
		return m;
	}

	/*
	 * Post month wise summary report page details
	 */
	@PostMapping(value = "/month-wise-summary-report-details")
	public ModelAndView getMonthWiseSummaryReportDetails(@RequestParam("from") String from,
			@RequestParam("to") String to, HttpSession session) throws ParseException {
		long empId = (long) session.getAttribute("empId");
		LinkedList<EmployeeHourDto> dto = mws.findEmployeeIdAndFromDateAndToDate(empId, from, to);
		ModelAndView m = new ModelAndView("month-wise-summary-report-details");
		m.addObject("dto", dto);
//		System.out.println(from);
		m.addObject("fromDate", new SimpleDateFormat("yyyy-MM-dd").parse(from));
		m.addObject("toDate",  new SimpleDateFormat("yyyy-MM-dd").parse(to));
		
		return m;
	}

}
