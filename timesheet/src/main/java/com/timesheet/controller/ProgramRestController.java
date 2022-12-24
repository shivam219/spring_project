package com.timesheet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.repository.ProgramRepository;

@RestController
public class ProgramRestController {

	@Autowired
	ProgramRepository pr;

	/*
	 * Access Program link page
	 */
	@GetMapping(value = "/program-link")
	public ResponseEntity<List<String[]>> getOtp(@RequestParam("prgPrnt") int prgPrnt) {
		return ResponseEntity.status(HttpStatus.OK).body(pr.findAllProgramLinkByPrgPrnt(prgPrnt));
	}

}
