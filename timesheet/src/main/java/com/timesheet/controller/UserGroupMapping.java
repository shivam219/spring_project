package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.timesheet.model.Employee;
import com.timesheet.model.UserGroup;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupRepository;

@Controller
public class UserGroupMapping {

	@Autowired
	EmployeeRepository er;

	@Autowired
	UserGroupRepository uGR;

	@GetMapping(value = "/user-group-mapping")
	public String getuserGroupMapping(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addAttribute("empList", (List<Employee>) er.findAll());
		return "user-group-mapping";
	}
	@GetMapping(value = "/user-group-add")
	public String getuserGroupAdd(Model m) {
		
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addAttribute("empList", (List<Employee>) er.findAll());
		return "user-group-add";
	}
	

}
