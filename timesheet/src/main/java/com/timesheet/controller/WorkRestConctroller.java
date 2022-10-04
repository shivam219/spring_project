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
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchByDate(Model m, HttpServletRequest request,
			HttpServletResponse response, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {

		if (request.getSession().getAttribute("empId") == null) {
			try {
				response.sendRedirect("login.jsp");
				System.out.println(request.getSession().getAttribute("empId") == null);
			} catch (Exception e) {
			}

		}
		long empId = (Long) request.getSession().getAttribute("empId");
		LinkedHashMap<String, List<Work>> mm = workService.getWorByStartDateEndDate(startDate, endDate, empId);
		LinkedHashMap<List<String>, List<Work>> mm2 = new LinkedHashMap<>();
		for (Map.Entry<String, List<Work>> entry : mm.entrySet()) {
			System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			ArrayList<String> al = new ArrayList<>();
			al.add(customerRepository.findProjectNameById(entry.getValue().get(0).getProjectId()));
			al.add(entry.getKey());
			mm2.put(al, entry.getValue());
		}
		return ResponseEntity.of(Optional.of(mm2));
	}

	@GetMapping("/fetch-work-by-id")
	public ResponseEntity<LinkedHashMap<List<String>, List<Work>>> fetchById(
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("empId") Long empId) {
		System.out.println(empId);
		LinkedHashMap<String, List<Work>> mm = workService.getWorByStartDateEndDate(startDate, endDate, empId);
		LinkedHashMap<List<String>, List<Work>> mm2 = new LinkedHashMap<>();
		for (Map.Entry<String, List<Work>> entry : mm.entrySet()) {
			System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			ArrayList<String> al = new ArrayList<>();
			al.add(customerRepository.findProjectNameById(entry.getValue().get(0).getProjectId()));
			al.add(entry.getKey());
			mm2.put(al, entry.getValue());
		}
		return ResponseEntity.of(Optional.of(mm2));
	}
}
