package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.timesheet.config.UserPrincipal;
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
//	@PostMapping("/loginprocess")
//	public String loginPost(HttpServletRequest request, Model m, @ModelAttribute User emp) {
//		System.out.println("post login by shivam");
//		Optional<User> user = ur.findByEmpIdAndPassword(emp.getEmpId(), emp.getPassword());
//		if (user.isEmpty() || user.get().getActive() == 0) {
//			request.setAttribute("error", "	Specified Employee Id & Password is wrong");
//			return "login";
//		} else {
//			HttpSession session = request.getSession();
//			String ugrpCode = ugm.findUgrpCodeByEmpId(emp.getEmpId());
//			session.setAttribute("empId", user.get().getEmpId());
//			session.setAttribute("empName", user.get().getEmployee().getFullName());
//			session.setAttribute("menus", ps.findAllMenus(Integer.parseInt(ugrpCode)));
//			m.addAttribute("emp", emp);
//			return "redirect:/home";
//		}
//	}
//	@PostMapping("/loginprocess")
//	public ResponseEntity<Object> loginPost(HttpServletRequest request, Model m, @ModelAttribute User emp) {
//		Optional<User> user = ur.findByEmpIdAndPassword(emp.getEmpId(), emp.getPassword());
//		if (user.isEmpty()) {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
//		}
//		if (user.get().getActive() == 0) {
//			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User is inactive");
//		} else {
//			HttpSession session = request.getSession();
//			String ugrpCode = ugm.findUgrpCodeByEmpId(emp.getEmpId());
//			session.setAttribute("empId", user.get().getEmpId());
//			session.setAttribute("empName", user.get().getEmployee().getFullName());
//			session.setAttribute("menus", ps.findAllMenus(Integer.parseInt(ugrpCode)));
//			m.addAttribute("emp", emp);
//			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Login Successfull");
//		}
//	}

//	@RequestMapping(value = "/")
//	public String blank(HttpServletRequest request) {
//		if (request.getSession().getAttribute("empId") == null) {
//			return "login";
//		}
//		return "redirect:/home";
//	}

	@GetMapping("login")
	public String login(HttpServletRequest request) {
		System.out.println("GET login page");
		request.getSession().invalidate();
		return "login";
	}

//	@GetMapping(value = "/logout")
//	public String logoutPage(HttpServletRequest request) {
//		request.getSession().invalidate();
//		return "redirect:/login";
//	}

	@RequestMapping("/login-success")
	public String index(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String username = "";
			if (principal instanceof UserDetails) {
				username = ((UserDetails) principal).getUsername();
			} else {
				username = principal.toString();
			}
			UserPrincipal up = (UserPrincipal) principal;
			HttpSession session = request.getSession();
			String ugrpCode = ugm.findUgrpCodeByEmpId(Long.valueOf(username));
			session.setAttribute("empId", Long.valueOf(username));
			session.setAttribute("empName", up.getFullName());
			session.setAttribute("menus", ps.findAllMenus(Integer.parseInt(ugrpCode)));
//		
			return "redirect:/home";
		}
		return "login";
	}

	@GetMapping("/login-error")
	public String login(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		String errorMessage = null;
		if (session != null) {
			AuthenticationException ex = (AuthenticationException) session
					.getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
			if (ex != null) {
				errorMessage = ex.getMessage();
			}
		}
		model.addAttribute("errorMessage", errorMessage);
//		model.addAttribute("errorMessage", "Bad Credentials");
		return "login";
	}

}
