package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.Employee;
import com.timesheet.service.EmployeeService;

@Controller
public class LoginController {

	@Autowired
	EmployeeService employeeService;

	@PostMapping("/loginprocess")
	public ResponseEntity<Object> loginPost(HttpServletRequest request, Model m, @RequestBody Employee emp) {

		if (employeeService.isValidEmployee(emp) != null) {
			HttpSession session = request.getSession();
			session.setAttribute("empId", emp.getEmpId());
			m.addAttribute("emp", emp);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Login Successfull");
		}
		return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User id and password invalid");

	}

	@RequestMapping(value = "/")
	public String blank(HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "login";
		}
		return "redirect:/home";
	}

	@GetMapping("login")
	public String login() {
		return "login";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request) {
		request.getSession().removeAttribute("empId");
		return "redirect:/login";
	}

	@GetMapping(value = "/home")
	public String homePageGet(HttpServletRequest request) {
		if (request.getSession().getAttribute("empId") == null) {
			return "redirect:login";
		}
		return "home";
	}

	@GetMapping(value = "/error")
	public String error() {
		return "login";
	}
}
