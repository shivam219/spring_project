package com.timesheet.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Program;
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

	@GetMapping("/program-master")
	public ModelAndView programMater() {
		ModelAndView modelAndView = new ModelAndView("program-master");
		modelAndView.addObject("programList", pr.findAllProgramIncludeSub());
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

	@PostMapping("/program-group-map")
	public String projectassign(HttpServletRequest request,
			@RequestParam(name = "ugrpCode", required = false, defaultValue = "5") int ugrpCode) {
		ugrpCode = 5;
		pgr.deleteByUgrpCodeNative(5);
		String createBy = request.getSession().getAttribute("empName").toString();
		List<String> parameterNames = new ArrayList<String>(request.getParameterMap().keySet());
		for (Iterator iterator = parameterNames.iterator(); iterator.hasNext();) {
			String prm = (String) iterator.next();
			Integer val = Integer.parseInt(request.getParameterValues(prm)[0]);
			ProgramGroup m = new ProgramGroup();
			m.setUgrpCode(ugrpCode);
			m.setPrgCode(val);
			m.setCreatedBy(createBy);
			pgr.save(m);
		}
		return "redirect:/program-add";
	}

	@GetMapping(value = "/program-edit")
	public String programEdit(Model m, @RequestParam(value = "ugrpCode", required = false) UserGroup ug) {
		m.addAttribute("ugrpCode", ug.getUgrpCode());
		m.addAttribute("ugrpDesc", ug.getUgrpDesc());
		m.addAttribute("programList", pr.findAllProgram2(ug.getUgrpCode()));
		m.addAttribute("allProgramList", pr.findAllProgramLinkEdit(ug.getUgrpCode()));
		return "program-edit";
	}

	@PostMapping("/program-group-edit-map")
	public String projectEditMap(HttpServletRequest request, @RequestParam("ugrpCode") int ugrpCode) {
		if (ugrpCode == 0) {
			return "redirect:/program-master";
		}
		System.out.println(ugrpCode);
		pgr.deleteByUgrpCodeNative(ugrpCode);
		String createBy = request.getSession().getAttribute("empName").toString();
		List<String> parameterNames = new ArrayList<String>(request.getParameterMap().keySet());
		for (Iterator iterator = parameterNames.iterator(); iterator.hasNext();) {
			String prm = (String) iterator.next();
			Integer val = Integer.parseInt(request.getParameterValues(prm)[0]);
			ProgramGroup m = new ProgramGroup();
			m.setUgrpCode(ugrpCode);
			m.setPrgCode(val);
			m.setCreatedBy(createBy);
			pgr.save(m);
		}
		return "redirect:/program-master";
	}

	@PostMapping("/program-menu-add")
	public String projectEditMap(HttpServletRequest request, @ModelAttribute() Program m) {
		HttpSession session = request.getSession();
		if (m.getPrgName() == null || m.getPrgDesc() == null) {
			return "redirect:/program-master";
		}
		Integer[] parr = pr.findLastPrgcodeAndPrgOrder(Integer.parseInt(m.getPrgPrnt())).get(0);
		m.setPrgCode((parr[0]+1));
		m.setPrgOrder((parr[1])+1);
		m.setCreatedBy((String) session.getAttribute("empName"));
		pr.save(m);
//		System.out.println(m);
		return "redirect:/program-master";
	}

}
