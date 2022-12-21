package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.Employee;
import com.timesheet.model.UserGroup;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupRepository;

@Controller
public class UserGroupController {

	@Autowired
	EmployeeRepository er;
	@Autowired
	UserGroupRepository ugr;
	
	@GetMapping(value = "/user-group-add")
	public String getuserGroupAdd(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) ugr.findAll()));
		m.addAttribute("empList", (List<Employee>) er.findAll());
		return "user-group-add";
	}

	
	@GetMapping(value = "/user-group-master")
	public String getUserGroupMaster(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) ugr.findAll()));
		return "user-group-master";
	}

	@PostMapping(value = "/user-group-create")
	public String createUserGroupMaster(@RequestBody UserGroup ug, HttpServletRequest request) {
		Employee emp = er.findById((Long) request.getSession().getAttribute("empId")).get();
		ug.setCreatedBy(emp.getFirstName() + " " + emp.getLastName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		ug.setCreatedTime(date);
		ugr.save(ug);
		return "user-group-master";
	}

	@GetMapping(value = "/user-group-edit")
	public String getEditUserGroup(Model m, @RequestParam("ugrpCode") UserGroup ug,@RequestParam(value = "ugrpCode", required = false) String ns, HttpServletRequest request) {
		m.addAttribute("ug", ug);
		return "user-group-edit";
	}

	@PostMapping(value = "/user-group-edit-process")
	public String editUserGroupMaster(@RequestBody UserGroup ug, HttpServletRequest request) {
		UserGroup tug = ugr.findById(ug.getUgrpCode()).get();
		Employee emp = er.findById((Long) request.getSession().getAttribute("empId")).get();
		ug.setModifiedBy(emp.getFirstName() + " " + emp.getLastName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		ug.setModifiedTime(date);
		ug.setCreatedBy(tug.getCreatedBy());
		ug.setCreatedTime(tug.getCreatedTime());
		ugr.save(ug);
		return "user-group-master";
	}
}
