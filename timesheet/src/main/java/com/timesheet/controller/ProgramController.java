package com.timesheet.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.ProgramGroup;
import com.timesheet.model.UserGroup;
import com.timesheet.repository.ProgramGroupRepository;
import com.timesheet.repository.ProgramRepository;
import com.timesheet.repository.UserGroupRepository;

@Controller
public class ProgramController {

	@Autowired
	ProgramRepository pr;

	@Autowired
	UserGroupRepository ugr;

	@Autowired
	ProgramGroupRepository pgr;

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
		modelAndView.addObject("programList", pr.findAllProgram2());
		modelAndView.addObject("userGroupList", ugr.findAllMappedGroup());
		return modelAndView;
	}

	@GetMapping(value = "/program-add")
	public String programAdd(Model m) {
		m.addAttribute("userGroupList", ugr.findAllNotMappedGroup());
		m.addAttribute("programList", pr.findAllProgram());
		m.addAttribute("allProgramList", pr.findAllProgramLink());
		return "program-add";
	}

	@GetMapping(value = "/program-edit")
	public String programEdit(Model m, @RequestParam(value = "ugrpCode", required = false) UserGroup ug) {
		m.addAttribute("ugrpCode", ug.getUgrpCode());
		m.addAttribute("ugrpDesc", ug.getUgrpDesc());
		m.addAttribute("programList", pr.findAllProgram2());
		m.addAttribute("allProgramList", pr.findAllProgramLink());
		return "program-edit";
	}

	@PostMapping("/program-group-map")
	public String projectassign(HttpServletRequest request,
			@RequestParam(name = "ugrpCode", required = false, defaultValue = "5") int ugrpCode,
			@RequestParam(name = "projectList", required = false, defaultValue = "") int[] projectList) {
		ugrpCode = 5;
		pgr.deleteByUgrpCodeNative(5);
		String createBy = request.getSession().getAttribute("empName").toString();
		List<String> parameterNames = new ArrayList<String>(request.getParameterMap().keySet());
		for (Iterator iterator = parameterNames.iterator(); iterator.hasNext();) {
			String prm = (String) iterator.next();
			Integer val = Integer.parseInt(request.getParameterValues(prm)[0]);
			System.out.println(val);
			ProgramGroup m = new ProgramGroup();
			m.setUgrpCode(ugrpCode);
			m.setPrgCode(val);
			m.setCreatedBy(createBy);
			pgr.save(m);
		}
		return "redirect:/program-add";
	}

}
