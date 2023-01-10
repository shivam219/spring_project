package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.model.FinancialYear;
import com.timesheet.model.Holiday;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.FinancialYearRepository;
import com.timesheet.repository.HolidayRepository;

@Controller
public class HolidayController {
	@Autowired
	EmployeeRepository er;

	@Autowired
	public FinancialYearRepository fyr;

	@Autowired
	public HolidayRepository hr;
 
	/*
	 * Access Holiday Master page
	 */
	@GetMapping(value = "holiday-master")
	public String holidayMaster(Model m) {
		m.addAttribute("listholiday", hr.findAll());
		return new String("holiday-master");
	}

	/*
	 * Access Add Holiday Master
	 */
	@GetMapping(value = "holiday-master-add")
	public String holidayMasterAdd(Model m) {
		List<FinancialYear> listYear = fyr.findAll();
		m.addAttribute("listYear", listYear);
		return new String("holiday-master-add");
	}

	/*
	 * Adding holiday
	 */
	@PostMapping(value = "holiday-master-add-process")
	public String holidayMasterAddProcess(Model m, @RequestBody Holiday h) {
		hr.save(h);
		return new String("holiday-master-add");
	}

	/*
	 * Access holiday Edit page
	 */
	@GetMapping(value = "holiday-master-edit")
	public String holidayMasterEdit(@RequestParam("hCode") Holiday h, Model m) {
		List<FinancialYear> listYear = fyr.findAll();
		m.addAttribute("listYear", listYear);
		m.addAttribute("holiday", h);
		System.err.println(h.getYearCode());
		m.addAttribute("year", h.getYearCode());
		m.addAttribute("years", fyr.findYearDesc());
		System.out.println(fyr.findYearDesc());
//		m.addAttribute("holiday", hr.findById(hCode).get());
		return new String("holiday-master-edit");
	}

	/*
	 * Edit holiday page
	 */
	@PostMapping(value = "holiday-master-edit-process")
	public ResponseEntity<Object> holidayMasterEditProcess(Model m, @RequestBody Holiday h) {
		hr.save(h);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("");
	}
}
