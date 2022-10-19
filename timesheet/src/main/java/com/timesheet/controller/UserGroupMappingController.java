package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

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
import com.timesheet.model.UserGroup;
import com.timesheet.model.UserGroupMapping;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupMappingRepository;
import com.timesheet.repository.UserGroupRepository;

@Controller
public class UserGroupMappingController {

	@Autowired
	EmployeeRepository er;

	@Autowired
	UserGroupRepository uGR;

	@Autowired
	UserGroupMappingRepository ugmr;
	@GetMapping(value = "/user-group-mapping-master")
	public String getuserGroupMappingMaster(Model m) {
		m.addAttribute("userGroupList", (ugmr.getAllGroup()));
		List<String[]> allGroup = ugmr.getAllGroup();
		for(String[] str  :allGroup ) {
		System.out.println(str[0]);
		System.out.println(str[1]);
		System.out.println(str[2]);
		}
		m.addAttribute("empList", (List<Employee>) er.findAll());
		return "user-group-mapping-master";
	}

	
	@GetMapping(value = "/user-group-mapping-add")
	public String getuserGroupMapping(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addAttribute("empList", (List<Employee>) er.findEmployeeNotHavingGroup());
		return "user-group-mapping";
	}


	@PostMapping(value = "/user-group-add-process")
	public ResponseEntity<Object> addUserGroupAdd(Model m, @RequestBody UserGroupMapping ugm,
			HttpServletRequest request) {
		if (ugmr.existsByEmpId(ugm.getEmpId())) {
			return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).body("Duplicate data");
		}
		Employee emp = er.findById((Long) request.getSession().getAttribute("empId")).get();
		ugm.setCreatedBy(emp.getFirstName() + " " + emp.getLastName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		ugm.setCreatedTime(date);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body( ugmr.save(ugm));
	}

	@GetMapping(value = "/user-group-mapping-edit")
	public String getUserGroupEdit(Model m, @RequestParam("id") UserGroupMapping ugm) {
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addAttribute("empName", er.findById(ugm.getEmpId()).get().getFirstName());
		m.addAttribute("empId", ugm.getEmpId());
		m.addAttribute("id", ugm.getId());
		m.addAttribute("empUgrpCode", ugm.getUgrpCode());
		return "user-group-mapping-edit";
	}

	@PostMapping(value = "/user-group-mapping-edit-process")
	public ResponseEntity<Object> editUserGroupMapping(Model m, @RequestBody UserGroupMapping ugm,
			HttpServletRequest request) {
		UserGroupMapping tugm = ugmr.findById(ugm.getId()).get();
		Employee emp = er.findById((Long) request.getSession().getAttribute("empId")).get();
		ugm.setModifiedBy(emp.getFirstName() + " " + emp.getLastName());
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		ugm.setModifiedTime(date);
		ugm.setCreatedBy(tugm.getCreatedBy());
		ugm.setCreatedTime(tugm.getCreatedTime());
		ugmr.save(ugm);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("");
//		UserGroupMapping
	}

}
