package com.timesheet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.HolidayRepository;
import com.timesheet.repository.LeaveRepository;
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

	/*
	 * Access home page
	 */

	@GetMapping(value = "/home")
	public String homePageGet(HttpServletRequest request, Model m) {
		long empId = (long) request.getSession().getAttribute("empId");
		m.addAttribute("empList", er.getEmpBirthday());
		m.addAttribute("holidayList", hr.getHolidays());
		m.addAttribute("leaves", ls.findLeaveStatusByEmpId(empId));
		return "home";
	}

}
