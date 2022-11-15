package com.timesheet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Employee;
import com.timesheet.model.UserGroup;
import com.timesheet.repository.ProgramRepository;
import com.timesheet.repository.UserGroupRepository;

@Controller
public class ProgramController {

	@Autowired 
	ProgramRepository pr;
	@Autowired
	UserGroupRepository ugr;

//	@GetMapping("/program-master")
//	public String assignproject(HttpServletRequest request, Model m) {

//		request.setAttribute("name", 10);
//		
//		ArrayList<Integer> a = new ArrayList();
//		Object c = a;
//		a.add(12);
//		request.setAttribute("list1", a);
//		ArrayList<Integer> b1 = (ArrayList<Integer>) request.getAttribute("list1");
//		int  b2 = (int) request.getAttribute("name");
//		System.out.println(b2);
//		return "program-master";
//	}

	@GetMapping("/program-master")
	public ModelAndView programMater() {
		ModelAndView modelAndView = new ModelAndView("program-master");
		modelAndView.addObject("programList",pr.findAllProgram());
		modelAndView.addObject("userGroupList", ((List<UserGroup>) ugr.findAll()));
		return modelAndView;
	}
	@GetMapping(value = "/program-add")
	public String programAdd(Model m) {
		m.addAttribute("userGroupList", ((List<UserGroup>) ugr.findAll()));
		m.addAttribute("programList", pr.findAllProgram());
		m.addAttribute("allProgramList", pr.findAllProgramLink());
		return "program-add";
	}
	@GetMapping(value = "/program-edit")
	public String programEdit(Model m, @RequestParam(value= "ugrpCode",required = false ) UserGroup ug) {
		m.addAttribute("ugrpCode", ug.getUgrpDesc());
		m.addAttribute("programList", pr.findAllProgram());
		m.addAttribute("allProgramList", pr.findAllProgramLink());
		return "program-edit";
	}
	

	
}
