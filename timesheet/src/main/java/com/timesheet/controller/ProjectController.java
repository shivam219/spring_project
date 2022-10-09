package com.timesheet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.EmployeeProject;
import com.timesheet.model.Project;
import com.timesheet.repository.EmployeeProjectRepository;
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

	@Autowired
	EmployeeProjectRepository EmployeeProjectRepository;

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

	@GetMapping(value = "add-project")
	public String getAddProject(Model m) {
		m.addAttribute("customerList", customerService.getAllcustomer());
		return "add-project";
	}

	@PostMapping("/project-process")
	public String projectmasterProcess(Model model, @ModelAttribute Project project) {
		projectService.save(project);
		return "redirect:/project-dashboard";
	}

	@GetMapping("/project-dashboard")
	public String dashboard(Model m) {
		m.addAttribute("projectList", projectService.getAllProject());
		return "project-dashboard";
	}

	@GetMapping("delete-project-by-id")
	public ResponseEntity<Object> deleteProjectByProjectId(Model m, @RequestParam("projectId") long ProjectId) {
		projectService.deleteProjectByProjectId(ProjectId);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Deleted");
	}
}
