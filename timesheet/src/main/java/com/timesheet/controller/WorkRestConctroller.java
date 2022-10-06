package com.timesheet.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.Work;
import com.timesheet.repository.CustomerRepository;
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

	@GetMapping("/fetchworkjson")
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchByDate( HttpServletRequest request,	@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
		long empId = (Long) request.getSession().getAttribute("empId");
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
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchSubmittedByDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, @RequestParam("empId") Long empId) {
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

	@GetMapping("/fetch-work-by-id")
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchById(HttpServletRequest request, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
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
}
