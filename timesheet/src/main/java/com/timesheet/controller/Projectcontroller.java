package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.EmployeeProject;
import com.timesheet.service.EmployeeProjectService;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.ProjectService;

@Controller
public class Projectcontroller {

	@Autowired
	ProjectService projectservice;
	@Autowired
	EmployeeService employeeService;

	@Autowired  
	EmployeeProjectService EmployeeProjectService;
	
	@ModelAttribute
	public void commonDataModel(Model m) {
		m.addAttribute("projectList", projectservice.getAllProject());
		m.addAttribute("empList", employeeService.getAllEmployee());
	}
	
	 
	@GetMapping("/projectmap")
	public String assignproject(Model m) {
		commonDataModel(m);
		return "projectmap";
	}

	@PostMapping("/assignprojectsave")
	public String assignprojectsave(Model m, @RequestParam("brandlist[]") long[] list,
			@RequestParam("brandlist2[]") int[] list2) {

		for (long l : list) {
			System.out.println(l);
			for (int l2 : list2) {
				System.out.println(l2);
			}
		}
		for (long l : list) {
			for (int l2 : list2) {
				EmployeeProject ep = new EmployeeProject();
				ep.setEmpId(l);
				ep.setProjectId(l2);			
				EmployeeProjectService.assignProject2(ep);
			}
		}
		commonDataModel(m);
		return "projectmap";
	}
}
