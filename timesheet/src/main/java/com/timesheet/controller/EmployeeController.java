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
import com.timesheet.repository.EmployeeRepository;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeRepository er;

	@GetMapping(value = "/employee-master")
	public String getEmployeeMaster(Model m) {
		List<Employee> empList = (List<Employee>) er.findAll();
		empList.sort((o1, o2) -> o1.getFirstName().compareTo(o2.getFirstName()));
		m.addAttribute("empList", empList);
		return "employee-master";
	}

	@GetMapping(value = "/employee-add")
	public String userMasterAdd() {
		return "employee-add";
	}

	@GetMapping(value = "/employee-edit")
	public String getEmployeeEdit(Model m, @RequestParam("empId") Long empId) {
		Optional<Employee> em = er.findById(empId);
		Employee emp = em.get();
		m.addAttribute("emp", emp);
		return "employee-edit";
	}

	@PostMapping(value = "/employee-edit-process")
	public ResponseEntity<Object> getEmployeeEditP(@RequestBody Employee emp, HttpServletRequest request) {		
		Employee empOld = er.findById(emp.getEmpId()).get();
		emp.setCreatedBy(empOld.getCreatedBy());
		emp.setCreatedTime(empOld.getCreatedTime());
		emp.setModifiedBy(request.getSession().getAttribute("empId").toString());
		er.save(emp);	
		er.updateEmployeePassword(emp.getEmpId(), emp.getEmpPassword());
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Employee is updated successfully");
	}

	@PostMapping(value = "/employee-add-process")
	public ResponseEntity<Object> addUser(@RequestBody Employee emp, HttpServletRequest request) {
		emp.setCreatedBy( request.getSession().getAttribute("empId").toString());
		emp = er.save(emp);
		er.updateEmployeePassword(emp.getEmpId(), emp.getEmpPassword());
		return ResponseEntity.status(HttpStatus.CREATED).body("User Create successfully");
	}
}
