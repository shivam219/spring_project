package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.Work;
import com.timesheet.service.WorkService;

@RestController
public class WorkController {

	@Autowired
	WorkService workService;
	
	@PostMapping("/saveWork")
	public ResponseEntity<Object> saveWork(@RequestBody List<Work> work) {
//		return ResponseEntity.of(Optional.of(work));
//		return ResponseEntity.status(HttpStatus.OK).body(work);
//		return ResponseEntity.of(Optional.of();
		if (workService.saveAllWork(work)) {
			return ResponseEntity.status(HttpStatus.CREATED).body("Save data");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Not save error");
		}
	}

}
