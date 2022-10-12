package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Employee;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.ProjectService;

@Controller
public class RegisterController {
	@Autowired
	EmployeeService employeeService;

	@GetMapping(value = "/register")
	public String register(Model model, @ModelAttribute Employee emp) {
		return "register";
	}

	@PostMapping(value = "/registerprocess")
	public String registerProcess(Model model, @ModelAttribute Employee emp) {
		System.out.println(emp);
//		employeeService.save(emp);
		return "login";
	}
}
