package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping(value = "/register")
	public String registerPage(Model model, @ModelAttribute Employee emp) {
		return "register";
	}

	@RequestMapping(value = "/registerprocess", method = RequestMethod.POST)
	public String registerProcess(Model model, @ModelAttribute Employee emp) { 
	System.out.println(employeeService.save(emp));
		return "login";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String blank(HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest request , @ModelAttribute Employee employee) {
		
//		employeeService.
		
		return "login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePageGet(HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		return "home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String homePage(HttpServletRequest request, Model model, @ModelAttribute Employee emp) {
		if (emp.getEmpId() == 111 && emp.getEmpPassword().equals("111")) {
			HttpSession session = request.getSession();
			session.setAttribute("empId", emp.getEmpId());
			return "home";
		}
		model.addAttribute("errorMsg", "please provide correct userid and passowrd ");
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request) {
		request.getSession().removeAttribute("empId");
		return "login";
	}

}
