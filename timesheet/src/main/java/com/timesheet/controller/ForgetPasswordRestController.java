package com.timesheet.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.User;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.EmailService;
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
	@Autowired
	UserRepository ur;

	@Autowired
	EmailService emailService;

	@GetMapping(value = "/get-otp")
	public ResponseEntity<Object> getOtp(@RequestParam("empId") Long empId) {
		if (!er.existsByEmpId(empId)) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("rrrr");
		}
		String to = employeeService.getEmailById(empId);
		String otp = String.valueOf(OTP(6));
		String msg = "OTP : " + otp;
		String subject = "Forget Password email";
		try {
			emailService.sendEmail(to, msg, subject);
		} catch (Exception e) {
			System.out.println("error");
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).build();
		}
		return ResponseEntity.status(HttpStatus.OK).body(otp);
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
	public ResponseEntity<Object> resetPassword(Model m, @RequestBody User emp) {
		ur.updateUserPassword(emp.getEmpId(), emp.getPassword());
		try {
			Thread.sleep(1000);
		} catch (Exception e) {
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("update password");
	}

	@GetMapping("/api/otp")
	public Map<String, String> getOneTimePassword() {
		try {
			Date date = new Date();
			HashMap<String, String> map = new HashMap<>();
			map.put("is_successful", "true");
			map.put("parameter_errors", "null");
			map.put("server_datetime", String.valueOf(date));
			map.put("code", "1234");
			return map;
		} catch (Exception exception) {
			return (Map<String, String>) ResponseEntity.badRequest().body("User can't get One time password.");
		}
	}
}
