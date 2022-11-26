package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.repository.CustomerRepository;

@Controller
public class ProjectRequestController {
	
	@Autowired
	CustomerRepository cr;

	@GetMapping(value = "project-request")
	public ModelAndView getMethodName() {
		ModelAndView m = new ModelAndView("project-request");
		m.addObject("customerList", cr.findAll());
		return m;
	}
}
