package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.GenLocationRepository;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeRepository er;

	@Autowired
	GenLocationRepository glr;
//	per page 5[n]
//	current page 

	@GetMapping("employee-master")
	public String getEmployeeMaster(@RequestParam(value = "page", required = false) Integer page, Model m) {
		if (page == null) {
			page = 1;
		}
		if (page <= 0)
			page = 1;
		page = page - 1;
		Pageable pageable = PageRequest.of(page, 8, Sort.by("createdTime"));
		Page<Employee> empListp = (Page<Employee>) er.findAll(pageable);
//		Pageable pageable = PageRequest.of(page, 250,  Sort.by(org.springframework.data.domain.Sort.Order.asc("emp_id")));
//		Page<Employee> empListp = (Page<Employee>) er.findEmployee(pageable , Sort.by(org.springframework.data.domain.Sort.Order.desc("empId")));
//		empList.sort((o1, o2) -> o1.getFirstName().compareTo(o2.getFirstName()));
		List<Employee> empList = empListp.getContent();
		m.addAttribute("empList", empList);
		m.addAttribute("empListSize", empListp.getTotalElements());
		m.addAttribute("currentPage", page + 1);
		m.addAttribute("totalPages", (empListp.getTotalPages()));
		return "employee-master";
	}

	@GetMapping(value = "/employee-add")
	public ModelAndView userMasterAdd() {
		ModelAndView m = new ModelAndView("employee-add");
		m.addObject("stateList", glr.findAllByState());
		m.addObject("countryList", glr.findAllByCountry());
		return m;
	}

	@PostMapping(value = "/employee-add-process")
	public ResponseEntity<Object> addUser(@RequestBody Employee emp, HttpServletRequest request) {
		emp.setCreatedBy(request.getSession().getAttribute("empId").toString());
		if (er.findById(emp.getEmpId()).isEmpty()) {
//			emp = er.save(emp);
			return ResponseEntity.status(HttpStatus.CREATED).body("User Employee successfully");
		}else {			
		return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Employee Already Exits");
		}
	}

	@GetMapping(value = "/employee-edit")
	public String getEmployeeEdit(Model m, @RequestParam("empId") Long empId) {
		Optional<Employee> em = er.findById(empId);
		Employee emp = em.get();
		m.addAttribute("emp", emp);
		m.addAttribute("stateList", glr.findAllByState());
		m.addAttribute("countryList", glr.findAllByCountry());
		return "employee-edit";
	}

	@PostMapping(value = "/employee-edit-process")
	public ResponseEntity<Object> getEmployeeEditP(@RequestBody Employee emp, HttpServletRequest request) {
		Employee empOld = er.findById(emp.getEmpId()).get();
		emp.setCreatedBy(empOld.getCreatedBy());
		emp.setCreatedTime(empOld.getCreatedTime());
		emp.setModifiedBy(request.getSession().getAttribute("empId").toString());
		er.save(emp);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Employee is updated successfully");
	}

}
