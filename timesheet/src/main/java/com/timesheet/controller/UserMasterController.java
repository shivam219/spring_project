package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

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
import com.timesheet.model.User;
import com.timesheet.model.UserGroup;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupRepository;
import com.timesheet.repository.UserRepository;

@Controller
public class UserMasterController {

	@Autowired
	EmployeeRepository er;
	@Autowired
	UserGroupRepository uGR;
	@Autowired
	UserRepository uR;

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
	public String userMaster(Model m) {
//		List<User> userList = (List<>) uR.getAllUser();
		m.addAttribute("userList", (uR.getAllUser()));
//		userList.sort((o1, o2) -> o1.getEmpId().compareTo(o2.getEmpId()));
//		m.addAttribute("userList", userList);
		return "user-master";
	}

	@GetMapping(value = "/user-master-edit")
	public String getUserMasterEdit(Model m, @RequestParam("empId") Employee emp) {
		Optional<User> em = uR.findById(emp.getEmpId());
		if (em.isEmpty() ) {
			List<User> userList = (List<User>) uR.findAll();
			userList.sort((o1, o2) -> o1.getEmpId().compareTo(o2.getEmpId()));
			m.addAttribute("userList", userList);
			return "redirect:user-master";
		} 
		User user = em.get();
		m.addAttribute("emp", emp);
		m.addAttribute("managerId", user.getManagerId());
		m.addAttribute("password", user.getPassword());
		m.addAttribute("active", user.getActive());
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addAttribute("empList", (List<Employee>) er.findAll());
		return "user-master-edit";
	}

	@PostMapping(value = "user-master-edit-process")
	public ResponseEntity<Object> getuserMasterEditProcess(Model m, @RequestBody User user) {
		uR.save(user);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("");
	}

	@GetMapping(value = "/user-master-add")
	public String getUserMasterAdd(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addAttribute("empList", (List<Employee>) er.findAllEmployeeNotMapUser());
		return "user-master-add";
	}

	@PostMapping(value = "/user-master-add-process")
	public ResponseEntity<Object> addUser(@RequestBody User user) {
		System.out.println(user);
		return ResponseEntity.status(HttpStatus.CREATED).body(uR.save(user));
	}

	@GetMapping(value = "/table")
	public String getTable() {
		return "table";
	}

}
