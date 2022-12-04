package com.timesheet.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.EmployeeProject;
import com.timesheet.model.Project;
import com.timesheet.model.User;
import com.timesheet.repository.EmployeeProjectRepository;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.repository.UserRepository;
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
	ProjectRepository pr;

	@Autowired
	UserRepository ur;

	@Autowired
	EmployeeProjectRepository EmployeeProjectRepository;

//	@ModelAttribute
//	public void commonDataModel(Model m) {
//		m.addAttribute("projectList", projectService.getAllProject());
//		m.addAttribute("empList", employeeService.getAllEmployee());
//	}

	@RequestMapping("/project-master")
	public ModelAndView dashboard() {
		ModelAndView m = new ModelAndView("project-master");
		m.addObject("projectList", pr.findAll());
		return m;
	}

	@GetMapping("/project-map")
	public ModelAndView assignproject() {
		ModelAndView m = new ModelAndView("project-map");
		m.addObject("users", ur.findAll());
		return m;
	}

	@GetMapping(value = "add-project")
	public String getAddProject(Model m) {
		m.addAttribute("customerList", customerService.getAllcustomer());
		return "project-add";
	}

	@PostMapping("/project-add-process")
	public ResponseEntity<Object> projectAdddProcess(Model model, @RequestBody Project project) {
		projectService.save(project);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Project Edited");
	}

	@GetMapping(value = "project-edit")
	public ModelAndView editProject(@RequestParam("projectId") Project project) {
		ModelAndView m = new ModelAndView("project-edit");
		m.addObject("project", project);
		m.addObject("customerList", customerService.getAllcustomer());
		return m;
	}

	@PostMapping("/project-edit-process")
	public ResponseEntity<Object> editProjectProcess(Model model, @RequestBody Project project) {
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Project Edit");
	}

	@PostMapping("/projectassign")
	public String projectassign(Model m, @RequestParam("empList") long empId, @RequestParam(name = "projectList" ,required = false ,defaultValue="" ) int[] projectList) {
		User user = ur.findById(empId).get();
		List<Project> pl = new ArrayList<Project>();
		for (int p : projectList) {
			Project curp = pr.findById(p).get();
			pl.add(curp);
		}
		user.setProject(pl);
		ur.save(user);
		
		projectService.deleteByEmpId(empId);
		for (int l2 : projectList) {
			EmployeeProject ep = new EmployeeProject();
			ep.setEmpId(empId);
			ep.setProjectId(l2);
			EmployeeProjectService.assignProject2(ep);
		}
		
		return "redirect:/project-map";
	}

	@GetMapping("delete-project-by-id")
	public ResponseEntity<Object> deleteProjectByProjectId(Model m, @RequestParam("projectId") long ProjectId) {
		projectService.deleteProjectByProjectId(ProjectId);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Deleted");
	}
}
