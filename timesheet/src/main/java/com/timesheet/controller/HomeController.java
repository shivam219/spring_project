package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.HolidayRepository;
import com.timesheet.repository.LeaveRepository;
import com.timesheet.service.HolidayService;

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

	@GetMapping(value = "/home")
	public String homePageGet(HttpServletRequest request, Model m) {
		
		SimpleDateFormat sdfy = new SimpleDateFormat("yyyy");
		String year = sdfy.format(new Date());
		
		SimpleDateFormat sdfm = new SimpleDateFormat("MM");
		String month = sdfm.format(new Date());
	
		m.addAttribute("empList", er.getEmpBirthday(year, month));
		m.addAttribute("holidayList", hr.getHolidays(year, month));
		m.addAttribute("ac", lr.getApprovedCountOfMonth());
		m.addAttribute("rc", lr.getRejectedCountOfMonth());
		m.addAttribute("cc", lr.getCancelledCountOfMonth());
		m.addAttribute("pc", lr.getPendingCountOfMonth());
		return "home";
	}

}
