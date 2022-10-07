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
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.service.EmployeeService;

@Controller
public class UserMaster {

	@Autowired
	EmployeeRepository er;

	@GetMapping(value = "/change-password")
	public String getMethodName() {
		return "change-password";
	}

	@PostMapping(value = "/change-password")
	public ResponseEntity<Object> changePassword(HttpServletRequest request,
			@RequestParam(value = "oldPass") String oldPass, @RequestParam(value = "newPass") String newPass) {
		String str = (String) request.getSession().getAttribute("empId").toString();
		Long empId = Long.valueOf(str);
		if (er.existsByEmpIdAndEmpPassword(empId, oldPass)) {
			er.updateEmployeePassword(1, newPass);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("password is updated successfully");
		}
		return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Old Password is invalid");
	}

	@GetMapping(value = "user_gui")
	public String getMethoame() {
		return "user_gui";
	}

	@GetMapping(value = "/user-master")
	public String userMaster() {
		return "user-master";
	}

	@GetMapping(value = "/user-master-edit")
	public String userMmasterEdit(Model m) {
		Optional<Employee> em = er.findById(1L);
		Employee emp = em.get();
		m.addAttribute("emp", emp);
		return "user-master-edit";
	}

	@PostMapping(value = "edit-user-process")
	public ResponseEntity<Object> loginPost(Model m, @RequestBody Employee emp) {
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(er.save(emp));
	}

}
