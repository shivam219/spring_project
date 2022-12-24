package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.timesheet.model.Employee;
import com.timesheet.model.FinancialYear;
import com.timesheet.model.Holiday;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.FinancialYearRepository;
import com.timesheet.repository.HolidayRepository;
import com.timesheet.repository.LeaveRepository;

@Controller
public class HolidayFinancialController {
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
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		fy.setDate(date);
		Employee emp = er.findById((Long) request.getSession().getAttribute("empId")).get();
		fy.setEmpName(emp.getFirstName() + " " + emp.getLastName());
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
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		fy.setDate(date);
		Employee emp = er.findById((Long) request.getSession().getAttribute("empId")).get();
		fy.setEmpName(emp.getFirstName() + " " + emp.getLastName());
		fyr.save(fy);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Updated");
	}

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
