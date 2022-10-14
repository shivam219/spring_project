package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.timesheet.model.UserGroup;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupRepository;

@Controller
public class UserGroupController {

	@Autowired
	EmployeeRepository er;
	@Autowired
	UserGroupRepository uGR;

	@GetMapping(value = "/user-group-master")
	public String getMethodName(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		return "user-group-master";
	}

}
