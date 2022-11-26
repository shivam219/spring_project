package com.timesheet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.User;

@Controller
public class UserReportController {

	@GetMapping("/report-user")
	public String getCustomerMaster(@RequestParam(name = "empId", defaultValue = "") User user, Model m) {
		if (user == null) {
			return "redirect:/employee-master";
		} 
		m.addAttribute("user", user);
//		m.addObject("customerDomains", (List<CustomerDomain>) cdr.findAll());
		return "report-user";
	}
}
