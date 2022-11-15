package com.timesheet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.Holiday;
import com.timesheet.model.Work;
import com.timesheet.repository.CustomerRepository;
import com.timesheet.repository.HolidayRepository;
import com.timesheet.repository.LeaveRepository;
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService;

@RestController

public class WorkRestConctroller {

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
	@GetMapping("/fetchworkjson")
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchByDate(HttpServletRequest request,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
		long empId = (Long) request.getSession().getAttribute("empId");
//		long empId=1;
		LinkedHashMap<String, List<Work>> mm = workService.getWorByStartDateEndDate(startDate, endDate, empId);
		LinkedHashMap<List<String>, List<Work>> mm2 = new LinkedHashMap<>();
		for (Map.Entry<String, List<Work>> entry : mm.entrySet()) {
			ArrayList<String> al = new ArrayList<>();
			al.add(customerRepository.findProjectNameById(entry.getValue().get(0).getProjectId()));
			al.add(entry.getKey());
			mm2.put(al, entry.getValue());
		}
		return ResponseEntity.of(Optional.of(mm2));
	}

	@GetMapping("/fetch-work-submitted")
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchSubmittedByDate(
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("empId") Long empId) {
		LinkedHashMap<String, List<Work>> mm = workService.getSubmittedWork(startDate, endDate, empId);
		LinkedHashMap<List<String>, List<Work>> mm2 = new LinkedHashMap<>();
		for (Map.Entry<String, List<Work>> entry : mm.entrySet()) {
			ArrayList<String> al = new ArrayList<>();
			al.add(customerRepository.findProjectNameById(entry.getValue().get(0).getProjectId()));
			al.add(entry.getKey());
			mm2.put(al, entry.getValue());
		}
		return ResponseEntity.of(Optional.of(mm2));
	}

//has linkedList error
	@GetMapping("/fetch-work-by-id")
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchById(HttpServletRequest request,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
		long empId = (Long) request.getSession().getAttribute("empId");
		LinkedHashMap<String, List<Work>> mm = workService.getSubmittedWork(startDate, endDate, empId);
	 
		LinkedHashMap<List<String>, List<Work>> mm2 = new LinkedHashMap<>();
		for (Map.Entry<String, List<Work>> entry : mm.entrySet()) {
			ArrayList<String> al = new ArrayList<>();
			al.add(customerRepository.findProjectNameById(entry.getValue().get(0).getProjectId()));
			al.add(entry.getKey());
			mm2.put(al, entry.getValue());
		}
		return ResponseEntity.of(Optional.of(mm2));
	}

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

	@GetMapping("/week-holidays")
	public ResponseEntity<List<Object>> weeklyHolidays(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {

		return ResponseEntity.of(Optional.of(hr.getWeekHoliday(startDate, endDate)));
	}
	
	
	@GetMapping("/week-leaves")
	public ResponseEntity<List<Object>> getWeekLeaves(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		System.out.println(startDate);
		System.out.println(endDate);
		return ResponseEntity.of(Optional.of(lr.getWeekLeaves(startDate, endDate)));
	}
	
	
}
