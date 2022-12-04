package com.timesheet.controller;

import java.util.Optional;

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
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.MonthSheet;
import com.timesheet.repository.MonthSheetRepository;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.MonthSheetService;

@Controller
public class MonthSheetController {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	MonthSheetService mse;

	@Autowired
	MonthSheetRepository msr;

	@GetMapping("/month-sheet-approve")
	public String workSubmitApprove(Model m, @RequestParam("monthSheetId") Long monthSheetId) {

		Optional<MonthSheet> msp = msr.findById(monthSheetId);
		if (msp.isEmpty()) {
			return "redirect:/month-sheet";
		}
		MonthSheet ms = msp.get();
		m.addAttribute("empMonthSheet", mse.findMonthSheetEmployeeDataByMonthId(monthSheetId).get(0));
		m.addAttribute("monthSheetDataList", mse.findMonthSheetDataAndApproveajax(monthSheetId));
		return "month-sheet-approve";
	}

	@GetMapping("/fetch-month-sheet-employee-approve")
	public ResponseEntity<Object> fetchMonthTimesheetEmployee(@RequestParam("monthSheetId") Long monthSheetId) {
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(mse.findMonthSheetDataAndApproveajax(monthSheetId));
	}

	@GetMapping("/month-sheet")
	public ModelAndView workApprove(HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");
		ModelAndView m = new ModelAndView("month-sheet");
		m.addObject("monthSheetList", mse.findMonthSheetAndSubmit(empId));
		return m;
	}

	@PostMapping("/month-sheet-change-status")
	public ResponseEntity<Object> workApprove(@RequestBody MonthSheet ms, HttpServletRequest request) {
		Optional<MonthSheet> msp = msr.findById(ms.getMonthSheetId());
		if (msp.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Unable to update timesheet");
		}
		if (!ms.isApproved()) {
			MonthSheet ms2 = msp.get();
			ms2.setApproved(false);
			ms2.setSubmit(false);
			msr.save(ms2);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Timesheet Status is updated");
		} else {
			MonthSheet ms2 = msp.get();
			ms2.setApproved(ms.isApproved());
			msr.save(ms2);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Timesheet Status is updated");
		}
	}

}
