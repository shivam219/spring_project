package com.timesheet.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.WorkService;

@RestController
public class ForgetPasswordRestController {

	@Autowired
	WorkService workService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	EmployeeRepository er;
	
	@GetMapping(value = "/get-otp")
	public String getOtp(@RequestParam("empId") Long empId) {
		String to = employeeService.getEmailById(empId);
		String otp = String.valueOf(OTP(6));
		String msg = "OTP : " + otp;
		String subject = "Forget Password email";
		workService.sendEmail(to, msg, subject);
		try {Thread.sleep(1000);} catch (Exception e) {}
		return otp;
	}

	static char[] OTP(int len) {
		String numbers = "0123456789";
		Random rndm_method = new Random();
		char[] otp = new char[len];
		for (int i = 0; i < len; i++) {
			otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
		}
		return otp;
	}
	@PostMapping(value = "reset-password")
	public ResponseEntity<Object> resetPassword(Model m, @RequestBody Employee emp) {
		er.updateEmployeePassword(emp.getEmpId(), emp.getEmpPassword());
		try {Thread.sleep(1000);} catch (Exception e) {}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("update password");
	}
	
}
