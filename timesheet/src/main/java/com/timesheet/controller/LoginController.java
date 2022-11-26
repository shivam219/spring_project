package com.timesheet.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.timesheet.model.User;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.EmployeeService;

@Controller
public class LoginController {

	@Autowired
	EmployeeService employeeService;
	@Autowired
	UserRepository ur;

	@PostMapping("/loginprocess")
	public ResponseEntity<Object> loginPost(HttpServletRequest request, Model m, @RequestBody User emp) {
		Optional<User> user = ur.findByEmpIdAndPassword(emp.getEmpId(), emp.getPassword());
//		System.out.println(user.get()); getting error or customer domain
		if (user.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
		}
		if (user.get().getActive() == 0) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User is inactive");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("empId", user.get().getEmpId());
			session.setAttribute("empName", user.get().getEmployee().getFullName());
			m.addAttribute("emp", emp);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Login Successfull");
		}
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
		request.getSession().invalidate();
		return "redirect:/login";
	}

}
