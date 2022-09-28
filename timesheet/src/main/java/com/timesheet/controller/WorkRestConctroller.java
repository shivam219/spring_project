package com.timesheet.controller;

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
import com.timesheet.service.ProjectService;
import com.timesheet.service.WorkService;

@RestController
public class WorkRestConctroller {

	@Autowired
	WorkService workService;

	@Autowired
	ProjectService projectservice;

//	returning list it converted into array so jqx[0]
//	@GetMapping("/fetchworkjson")
//	public  ResponseEntity<List<Work>> fetchByDate(Model m ,HttpServletRequest request ,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate) {
//		LinkedHashMap<String, List<Work>> mm = workService.getWorByStartDateEndDate(startDate, endDate,1);
//		return  ResponseEntity.of(Optional.of(mm.get("TCS")));
//	}

	@GetMapping("/fetchworkjson")
	public ResponseEntity<LinkedHashMap<String, List<Work>>> fetchByDate(Model m, HttpServletRequest request,
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
		LinkedHashMap<String[], List<Work>> mm2 = new LinkedHashMap<>();
		for (Map.Entry<String, List<Work>> entry : mm.entrySet()) {
			System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
			
		}


		return ResponseEntity.of(Optional.of(mm));
	}

}
