package com.timesheet.controller;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.HolidayRepository;
import com.timesheet.repository.LeaveRepository;
import com.timesheet.repository.UserGroupMappingRepository;
import com.timesheet.service.HolidayService;
import com.timesheet.service.LeaveService;

@Controller
public class HomeController {

	@Autowired
	public EmployeeRepository er;

	@Autowired
	public HolidayService holidayService;

	@Autowired
	public HolidayRepository hr;

	@Autowired
	LeaveRepository lr;
	@Autowired
	LeaveService ls;

	@Autowired
	UserGroupMappingRepository rgmp;

	/*
	 * Access home page
	 */

	@GetMapping(value = "/home")
	public String homePageGet(HttpServletRequest request, Model m) {
		long empId = (long) request.getSession().getAttribute("empId");
		m.addAttribute("empList", er.getEmpBirthday());
		m.addAttribute("holidayList", hr.getHolidays());
		m.addAttribute("leaves", ls.findLeaveStatusByEmpId(empId));
//		List<String[]> urlRoles = rgmp.findGroupSecurty();
//		for (Iterator<String[]> it = urlRoles.iterator(); it.hasNext();) {
//			String[] url = it.next();
//			System.out.println(url[0]);
//			System.out.println(Arrays.toString(url[1].split(",")).replace("[", "").replace("]", "") );
////			System.out.println(Arrays.toString(url[1].split(",")[0]));
//		
//		}
		return "home";
	}

}
