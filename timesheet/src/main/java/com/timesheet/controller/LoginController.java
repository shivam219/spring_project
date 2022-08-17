package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.timesheet.model.Employee;
import com.timesheet.service.EmployeeService;

@Controller
public class LoginController {

	@Autowired
	EmployeeService employeeService;

	@ModelAttribute
	public void commonDataModel(Model m) {
		// put data and object this model will access it all page
	}

	@RequestMapping(value = "/")
	public String blank(HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}
 
	@PostMapping("/loginprocess")
	public String loginPost(HttpServletRequest request, Model model, @ModelAttribute Employee emp) {
		if (employeeService.isValidEmployee(emp) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("empId", emp.getEmpId());
			return "home";
		}
		model.addAttribute("errorMsg", "please provide correct userid and passowrd ");
		return "login";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request) {
		request.getSession().removeAttribute("empId");
		return "login";
	}

	@GetMapping(value = "/home")
	public String homePageGet(HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		return "home";
	}
}
