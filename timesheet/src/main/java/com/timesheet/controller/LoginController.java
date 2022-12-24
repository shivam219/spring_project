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
import com.timesheet.repository.ProgramRepository;
import com.timesheet.repository.UserGroupMappingRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.ProgramService;

@Controller
public class LoginController {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	ProgramService ps;

	@Autowired
	UserRepository ur;

	@Autowired
	UserGroupMappingRepository ugm;

	@Autowired
	ProgramRepository pr;

	/*
	 * Login to Timesheet Portal
	 */
	@PostMapping("/loginprocess")
	public ResponseEntity<Object> loginPost(HttpServletRequest request, Model m, @RequestBody User emp) {
		Optional<User> user = ur.findByEmpIdAndPassword(emp.getEmpId(), emp.getPassword());
		if (user.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
		}
		if (user.get().getActive() == 0) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User is inactive");
		} else {
			HttpSession session = request.getSession();
			String ugrpCode = ugm.findUgrpCodeByEmpId(emp.getEmpId());
			session.setAttribute("empId", user.get().getEmpId());
			session.setAttribute("empName", user.get().getEmployee().getFullName());
			session.setAttribute("ugrpCode", ugrpCode);
//			session.setAttribute("menu", pr.findAllMenuByGroupCode(Integer.parseInt(ugrpCode)));
//			session.setAttribute("submenu", pr.findAllSubMenuByGroupCode(Integer.parseInt(ugrpCode)));
			session.setAttribute("menus", ps.findAllMenus(Integer.parseInt(ugrpCode)));

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
	public String login(HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession().removeValue("error");
		request.getSession().removeAttribute("error");

		return "login";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/login";
	}

}
