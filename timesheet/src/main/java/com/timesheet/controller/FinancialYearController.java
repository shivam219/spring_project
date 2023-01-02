package com.timesheet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.FinancialYearRepository;
import com.timesheet.repository.HolidayRepository;

@Controller
public class FinancialYearController {
	@Autowired
	EmployeeRepository er;

	@Autowired
	public FinancialYearRepository fyr;

	@Autowired
	public HolidayRepository hr;

	/*
	 * Access Year master page
	 */
	@GetMapping(value = "year-master")
	public String yearMaster(Model m) {
		List<FinancialYear> listYear = fyr.findAll();
		m.addAttribute("listYear", listYear);
		return new String("year-master");
	}

	/*
	 * Access Add Year master
	 */
	@GetMapping(value = "year-master-add")
	public String yearMasterAdd(Model m) {
		return new String("year-master-add");
	}

	/*
	 * Creating Year
	 */
	@PostMapping(value = "/year-master-add-process")
	public ResponseEntity<Object> addUser(@RequestBody FinancialYear fy, HttpServletRequest request) {
		fy.setCreatedBy(request.getSession().getAttribute("empId").toString());
		fyr.save(fy);
		return ResponseEntity.status(HttpStatus.CREATED).body("Ok");
	}

	/*
	 * Access Edit Year
	 */
	@GetMapping(value = "year-master-edit")
	public String yearMasterEdit(@RequestParam("yearCode") Integer yearCode, Model m) {
		m.addAttribute("year", fyr.findById(yearCode).get());
		return new String("year-master-edit");
	}

	/*
	 * Editing year
	 */
	@PostMapping(value = "year-master-edit-process")
	public ResponseEntity<Object> earMasterEditProcess(Model m, @RequestBody FinancialYear fy,
			HttpServletRequest request) {
		fy.setModifiedBy(request.getSession().getAttribute("empId").toString());
		fyr.updateFinancialYear(fy.getYearCode(), fy.getModifiedBy(), fy.getYearDesc());
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Updated");
	}

}
