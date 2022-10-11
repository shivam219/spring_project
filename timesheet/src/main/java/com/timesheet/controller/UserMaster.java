package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
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
	public String userMaster(Model m) {
		List<Employee> empList = (List<Employee>) er.findAll();
//		Collections.sort(empList
		empList.sort((o1, o2) -> o1.getFirstName().compareTo(o2.getFirstName()));
		m.addAttribute("empList", empList);
		return "user-master";
	}

	@GetMapping(value = "/user-master-edit")
	public String userMmasterEdit(Model m, @RequestParam("empId") Long empId) {
		Optional<Employee> em = er.findById(empId);
		Employee emp = em.get();
		m.addAttribute("emp", emp);
		return "user-master-edit";
	}

	@PostMapping(value = "edit-user-process")
	public ResponseEntity<Object> loginPost(Model m, @RequestBody Employee emp) {
		er.updateEmployeePassword(1, emp.getEmpPassword());
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(er.save(emp));
	}

	@GetMapping(value = "/user-master-add")
	public String userMasterAdd() {
		return "user-master-add";
	}

	@PostMapping(value = "/add-user")
	public String addUser(@RequestBody Employee emp) {
		System.out.println(emp);
		  System.out.println(emp = er.save(emp));
		er.updateEmployeePassword(emp.getEmpId(), emp.getEmpPassword());
		return "user-master-add";
	}

}
