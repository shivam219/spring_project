package com.timesheet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.timesheet.dto.DaySheetDto;
import com.timesheet.model.DaySheet;
import com.timesheet.model.MonthSheet;
import com.timesheet.model.WorkMaster;
import com.timesheet.repository.CustomerRepository;
import com.timesheet.repository.DaySheetRepository;
import com.timesheet.repository.HolidayRepository;
import com.timesheet.repository.LeaveRepository;
import com.timesheet.repository.MonthSheetRepository;
import com.timesheet.service.DaySheetService;
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService;

@Controller
public class DaySheetController {

	@Autowired
	DaySheetRepository dsr;

	@Autowired
	MonthSheetRepository msr;
	@Autowired
	DaySheetService daySheetService;

	@Autowired
	WorkService workService;

	@Autowired
	ProjectService projectservice;

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	HolidayRepository hr;

	@Autowired
	LeaveRepository lr;

	@GetMapping("/day-sheet")
	public String work() {
		return "day-sheet";
	}

	@PostMapping("/day-sheet-save")
	public ResponseEntity<Object> daySheetSave(@RequestBody List<DaySheet> daySheet,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam(name = "saveType", defaultValue = "0") Integer saveType, HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");
// save - 0 sub -1 app -2
		String sd[] = startDate.split("-");
		MonthSheet mss = msr.findByEmpId(empId, Integer.parseInt(sd[1]), Integer.parseInt(sd[0]));
		dsr.deleteByStartDateAndEndDateMonthId(startDate, endDate, mss.getMonthSheetId());

		String ed[] = endDate.split("-");
		MonthSheet mse = msr.findByEmpId(empId, Integer.parseInt(ed[1]), Integer.parseInt(ed[0]));
		if (mse.getMonthSheetId() != mss.getMonthSheetId()) {
			dsr.deleteByStartDateAndEndDateMonthId(startDate, endDate, mse.getMonthSheetId());
		}

		dsr.saveAll(daySheet);
		if (saveType == 0) {
			
		} else if (saveType == 1 ) {
			MonthSheet mss2 = msr.findByEmpId(empId, Integer.parseInt(sd[1]), Integer.parseInt(sd[0]));
			mss2.setSubmit(true);
			mss2.setSubmitDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			msr.save(mss2);
			System.out.println(saveType);
		}

		return ResponseEntity.ok().body("");
	}

	@GetMapping("/fetch-day-sheet-week")
	public ResponseEntity<List<DaySheetDto>> fetchByDate(HttpServletRequest request,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
		long empId = (Long) request.getSession().getAttribute("empId");
		Map<Integer, DaySheetDto> md = daySheetService.getDaySheetByStartDateAndEndDate(startDate, endDate, empId);
		List<DaySheetDto> ld = new ArrayList<>();
		for (Map.Entry<Integer, DaySheetDto> m : md.entrySet()) {
			ld.add(m.getValue());
		}
		return ResponseEntity.of(Optional.of(ld));
	}

	@GetMapping("/week-holidays")
	public ResponseEntity<List<Object>> weeklyHolidays(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {

		return ResponseEntity.of(Optional.of(hr.getWeekHoliday(startDate, endDate)));
	}

	@PostMapping(value = "/day-sheet-status")
	public ResponseEntity<Object> workStatus(HttpServletRequest request, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		String sd[] = startDate.split("-");
		MonthSheet ms = msr.findByEmpId(empId, Integer.parseInt(sd[1]), Integer.parseInt(sd[0]));
		if(ms!=null) {
			if (ms.isSubmit()) {
				return ResponseEntity.status(HttpStatus.OK).body("1");
			} else if (ms.isApproved()) {
				return ResponseEntity.status(HttpStatus.OK).body("2");
			}
		}
		return ResponseEntity.status(HttpStatus.OK).body("0");
	}

	@GetMapping("/week-leaves")
	public ResponseEntity<List<Object>> getWeekLeaves(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		return ResponseEntity.of(Optional.of(lr.getWeekLeaves(startDate, endDate)));
	}

//not use
	@GetMapping("/get-week-holidays")
	public ResponseEntity<String[]> getweekHolidays(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) throws ParseException {

		String[] strAr = new String[7];
		List<Integer> weekHolidays = hr.getWeekHolidays(startDate, endDate);
		if (weekHolidays.size() <= 0) {
			return ResponseEntity.of(Optional.of(strAr));
		}
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
		int j = 0;
		for (int i = 0; i < 7; i++) {
			strAr[i] = "";
			if (weekHolidays.get(j) == (date.getDate() + i)) {
				strAr[i] = "bg-success";
				j++;
			}
		}
		return ResponseEntity.of(Optional.of(strAr));
	}

}
