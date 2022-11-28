package com.timesheet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Customer;

@Controller
public class ReportCustomerController {

	@GetMapping(value = "/report-customer")
	public ModelAndView getReportCustomre(@RequestParam("customerId") Customer c) {
		ModelAndView m = new ModelAndView("report-customer");
		m.addObject("customer", c);
		return m;
	}

}
