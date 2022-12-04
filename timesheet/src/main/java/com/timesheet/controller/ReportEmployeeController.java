package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.dto.EmployeeNameDto;
import com.timesheet.dto.UserDto;
import com.timesheet.model.MonthSheet;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.MonthSheetRepository;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.MonthSheetService;
import com.timesheet.service.UserMasterService;

@Controller
public class ReportEmployeeController {

	@Autowired
	MonthSheetService mse;

	@Autowired
	MonthSheetRepository msr;

	@Autowired
	EmployeeRepository er;
	@Autowired
	EmployeeService es;

	@Autowired
	UserMasterService ums;

	@GetMapping(value = "/report-month-employee")
	public String getEmployeeMonthReport(Model m) {
		List<EmployeeNameDto> findEmployeeName = es.findEmployeeName();
		m.addAttribute("employeeName", findEmployeeName);
		return "report-month-employee";
	}

	@GetMapping(value = "/fetch-employee-year")
	public ResponseEntity<List<String>> fetchEmployeeYear(@RequestParam long empId) {
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(er.findEmployeeWorkingYear(empId));
	}

	@GetMapping(value = "/fetch-employee-month")
	public ResponseEntity<List<String[]>> fetchEmployeeMonth(@RequestParam long empId, @RequestParam Integer yearCode) {
		List<String[]> m = er.findEmployeeWorkingMonth(empId, yearCode);
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(er.findEmployeeWorkingMonth(empId, yearCode));
	}

	@PostMapping(value = "/report-month-employee-data")
	public String getEmployeeMonthData(@ModelAttribute MonthSheet ms, @RequestParam long empId, Model m) {
		List<UserDto> ud = ums.findEmpNameManagerNameEmpGroupDescByEmpId(empId);
		m.addAttribute("monthSheetDataList", mse.findMonthSheetDataAndApprove(ms.getMonthSheetId()));
		m.addAttribute("emp", ud.get(0));
		m.addAttribute("monthSheetId", ms.getMonthSheetId());
		return "report-month-employee-data";
	}   

	@PostMapping("/fetch-month-sheet-employee")
	public ResponseEntity<Object> monthSheetEmployee(@RequestParam long monthSheetId) {
		Optional<MonthSheet> msp = msr.findById(monthSheetId);
		if (msp.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("No data");
		} else {
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(mse.findMonthSheetDataAndApprove(monthSheetId));
		}
	}
	@PostMapping("/fetch-month-sheet-employee-chart")
	public ResponseEntity<Object> monthSheetEmployeeChart(@RequestParam long monthSheetId) {
		Optional<MonthSheet> msp = msr.findById(monthSheetId);
		if (msp.isEmpty()) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("No data");
		} else {
			
			return ResponseEntity.status(HttpStatus.ACCEPTED).body(mse.findMonthSheetEmployeeChart(monthSheetId));
		}
	}
}
