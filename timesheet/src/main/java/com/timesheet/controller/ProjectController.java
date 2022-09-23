package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.EmployeeProject;
import com.timesheet.model.Project;
import com.timesheet.service.CustomerService;
import com.timesheet.service.EmployeeProjectService;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	CustomerService customerService;

	@Autowired
	ProjectService projectService;
	@Autowired
	EmployeeService employeeService;

	@Autowired
	EmployeeProjectService EmployeeProjectService;

	@ModelAttribute
	public void commonDataModel(Model m) {
		m.addAttribute("projectList", projectService.getAllProject());
		m.addAttribute("empList", employeeService.getAllEmployee());
	}

	@GetMapping("/projectmap")
	public String assignproject(Model m) {
		commonDataModel(m);
		return "projectmap";
	}

	@PostMapping("/projectassign")
	public String projectassign(Model m, @RequestParam("empList") long emp,
			@RequestParam("projectList") int[] projectList) {
		projectService.deleteByEmpId(emp);
		for (int l2 : projectList) {
			EmployeeProject ep = new EmployeeProject();
			ep.setEmpId(emp);
			ep.setProjectId(l2);
			EmployeeProjectService.assignProject2(ep);
		}
		commonDataModel(m);
		return "projectmap";
	}

	@PostMapping("/projectdelete")
	public String deleteByEmpId(Model m, @RequestParam("empList") long emp) {
		projectService.deleteByEmpId(emp);
		commonDataModel(m);
		return "projectmap";
	}



	@PostMapping("/projectmasterprocess")
	public String projectmasterProcess(Model model, @ModelAttribute Project project) {
		projectService.save(project);
		return "projectmasterdashboard";
	}

	@GetMapping("/projectmasterdashboard")
	public String dashboard(Model m) {
		m.addAttribute("projectList", projectService.getAllProject());
		return "projectmasterdashboard";
	}
	
	
	@GetMapping(value = "/customermaster1")
	public String getcustomermaster() {
		return "customermaster1";

	}
	
	@GetMapping("/deleteprojectbyid")
	public String deleteProjectByProjectId(Model m, @RequestParam("project_id") long ProjectId) {
		projectService.deleteProjectByProjectId(ProjectId);
		commonDataModel(m);
		return "projectmasterdashboard";
	}
	
	
	
}
