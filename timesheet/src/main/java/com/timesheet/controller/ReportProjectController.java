package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.dto.EmployeeProjectDto;
import com.timesheet.model.Project;
import com.timesheet.repository.DaySheetRepository;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.FinancialYearRepository;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.service.ProjectService;

@Controller
public class ReportProjectController {

	@Autowired
	ProjectRepository pr;

	@Autowired
	ProjectService ps;

	@Autowired
	EmployeeRepository er;

	@Autowired
	FinancialYearRepository fyr;

	@Autowired
	DaySheetRepository dsr;

	/*
	 * Access report project page
	 */
	@GetMapping(value = "/report-project")
	public ModelAndView getReportCustomre(@RequestParam("projectId") Project p) {
		ModelAndView m = new ModelAndView("report-project");
		m.addObject("p", p);
		m.addObject("empList", ps.getProjectEmloyeeDetails(p.getProjectId()));
		return m;
	}

	/*
	 * Fetch project employee sheet
	 */
	@PostMapping("/fetch-project-employee-sheet")
	public ResponseEntity<Object> monthSheetEmployee(@RequestParam Integer projectId) {
		List<EmployeeProjectDto> li = ps.findEmployeeNameAndHourInProject(projectId);
		if (li.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("No data");
		} else {
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(li);
		}
	}

	/*
	 * Access project report Summary page
	 */
	@GetMapping(value = "/report-project-summary")
	public ModelAndView getProjectReportSummary() {
		ModelAndView m = new ModelAndView("report-project-summary");
		m.addObject("pjtList", pr.findAll());
		return m;
	}

	/*
	 * Access project report Summary page
	 */
	@PostMapping(value = "/report-project-summary-details")
	public ModelAndView getProjectReportSummaryDetails(@RequestParam("projectId") Project p,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {

		ModelAndView m = new ModelAndView("report-project-summary-details");
		m.addObject("empList", ps.findEmployeeNameAndGroupDescAndHourByStartDateAndDate(386, startDate, endDate));
		m.addObject("p", p);
//		m.addObject("empList", ps.findEmployeeNameAndHourInProjectByStartDateAndDate(386, "2022-12-28", "2022-12-28"));
		return m;
	}

	/*
	 * Access project overshot report page
	 */
	@GetMapping(value = "/report-project-overshot")
	public ModelAndView getProjectOverShotReport() {
		ModelAndView m = new ModelAndView("report-project-overshot");
		m.addObject("pjtList", pr.findAll());
		return m;
	}

	/*
	 * Access Project Overshot report page
	 */
	@PostMapping(value = "/report-project-overshot-details")
	public ModelAndView getProjectReportOverShotDetails(@RequestParam("projectId") Project p) {
		ModelAndView m = new ModelAndView("report-project-overshot-details");
		m.addObject("p", p);
		m.addObject("totalHour", pr.findTotalHourByProjectId(p.getProjectId()));
		return m;
	}

	/*
	 * Access project overshot report page
	 */
	@GetMapping(value = "/report-project-wise-overshot")
	public ModelAndView getProjectWiseOverShotReport() {
		ModelAndView m = new ModelAndView("report-project-wise-overshot");
		m.addObject("pjtList", pr.findStockAkhirPerProductIn());
		return m;
	}

	/*
	 * Access project overshot report page
	 */
	@GetMapping(value = "/report-project-employee-breakdown")
	public ModelAndView getProjectEmployeeBreakDown() {
		ModelAndView m = new ModelAndView("report-project-employee-breakdown");
		m.addObject("pjtList", pr.findAll());
		m.addObject("months", er.findMonth());
		m.addObject("years", fyr.findAll());
		return m;
	}

	/*
	 * Access Project Overshot report page
	 */
	@PostMapping(value = "/report-project-employee-breakdown-details")
	public ModelAndView getProjectEmployeeBreakDown(@RequestParam("projectId") Project p,
			@RequestParam("month") String month, @RequestParam("year") String year) {
		ModelAndView m = new ModelAndView("report-project-employee-breakdown-details");
		m.addObject("p", p);
		m.addObject("empList", dsr.findStockAkhirPerProductIn(p.getProjectId(),Integer.valueOf(year),Integer.valueOf(month)));
		m.addObject("totalHour", pr.findTotalHourByProjectId(p.getProjectId()));
		return m;
	}

}
