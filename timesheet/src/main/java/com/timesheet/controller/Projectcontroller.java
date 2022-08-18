package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.service.EmployeeService;
import com.timesheet.service.ProjectService;

@Controller
public class Projectcontroller {

	@Autowired
	ProjectService projectservice;
	@Autowired
	EmployeeService employeeService;

	@GetMapping("/assignproject")
	public String assignproject(Model m) {
		m.addAttribute("projectList", projectservice.getAllProject());
		m.addAttribute("empList", employeeService.getAllEmployee());
		return "assignproject";
	}

	@GetMapping("/assignproject2")
	public String assignproject2(Model m) {
		m.addAttribute("projectList", projectservice.getAllProject());
		m.addAttribute("empList", employeeService.getAllEmployee());
		return "assignproject2";
	}

	@PostMapping("/assignprojectsave")
	public String assignprojectsave(Model m, @RequestParam("brandlist[]") String[] list ,@RequestParam("brandlist2[]") String[] list2) {

		for(String l : list) {
			System.out.println(l);
		}
		for(String l : list2) {
			System.out.println(l);
		}
		return "assignproject2";
	}
}
